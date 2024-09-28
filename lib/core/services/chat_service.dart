import 'package:aislecheck/config/service_locator.dart';
import 'package:aislecheck/core/constants/strings/firebase_constants.dart';
import 'package:aislecheck/core/services/admin_profile_service.dart';
import 'package:aislecheck/core/services/session_manage_service.dart';
import 'package:aislecheck/features/auth/admin_auth/models/add_admin_model.dart';
import 'package:aislecheck/features/chat_list/models/messages_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  static ChatService? _chatService;
  ChatService._internal();
  factory ChatService() {
    return _chatService ??= ChatService._internal();
  }
  //get instance of auth anf firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //SEND MESSAGE
  Future<void> sendMessage(String receiverId, String message) async {
    //get current user info
    if (_auth.currentUser == null) return;
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    AdminModel adminModel =
        await locator.get<AdminProfileService>().getAdminById();
    //create new messages
    final MessagesModel newMessage = MessagesModel(
        senderId: currentUserId,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp,
        senderEmail: currentUserEmail,
        currentUserImageUrl: adminModel.imageUrl);

    //construct chat room id from current user id and receiver id(sorted to ensure uniqueness)
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); //sort the ids(this is to ensure that chat room id is unique,for any paier of peoples)
    String chatRoomId =
        ids.join("_"); //combile the ids into a single string as chatroom id

    //add new meesages to database
    await _firestore
        .collection(FirebaseConstants.chatRoom)
        .doc(chatRoomId)
        .collection(FirebaseConstants.messagesCollection)
        .add(newMessage.toMap());
  }

  // //GET MESSAGES
  // Future<List<MessagesModel>> getMessages(
  //     String userId, String otherUserId) async {
  //   //construct chat room id from current user id and receiver id(sorted to ensure uniqueness)
  //   List<String> ids = [userId, otherUserId];
  //   ids.sort(); //sort the ids(this is to ensure that chat room id is unique,for any paier of peoples)
  //   String chatRoomId =
  //       ids.join("_"); //combile the ids into a single string as chatroom id
  //   QuerySnapshot<Map<String, dynamic>> meesagesQuerySnapShot = await _firestore
  //       .collection(FirebaseConstants.chatRoom)
  //       .doc(chatRoomId)
  //       .collection(FirebaseConstants.messagesCollection)
  //       .orderBy('timestamp', descending: true)
  //       .get();

  //   List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
  //       meesagesQuerySnapShot.docs;

  //   List<MessagesModel> meesagesList =
  //       data.map((e) => MessagesModel.fromMap(e.data())).toList();
  //   return meesagesList;
  // }

  //GET MESSAGES
  Stream<QuerySnapshot> getMessages(String otherUserId) {
    //construct chat room id from current user id and receiver id(sorted to ensure uniqueness)
    if (_auth.currentUser == null) return const Stream.empty();
    String uuid = _auth.currentUser!.uid;
    List<String> ids = [uuid, otherUserId];
    ids.sort(); //sort the ids(this is to ensure that chat room id is unique,for any paier of peoples)
    String chatRoomId =
        ids.join("_"); //combile the ids into a single string as chatroom id
    Stream<QuerySnapshot> meesagesQuerySnapShot = _firestore
        .collection(FirebaseConstants.chatRoom)
        .doc(chatRoomId)
        .collection(FirebaseConstants.messagesCollection)
        .orderBy('timestamp', descending: true)
        .snapshots();

    return meesagesQuerySnapShot;
  }
}
