import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/admin_home/models/stock_model.dart';
import 'package:aislecheck/features/ads/models/ad.dart';
import 'package:aislecheck/features/chat_list/models/chat_contact_model.dart';
import 'package:aislecheck/features/chat_list/models/recent_chat_model.dart';
import 'package:aislecheck/features/forecasting/models/lower_forecasting_model.dart';
import 'package:aislecheck/features/forecasting/models/top_forecasting_model.dart';
import 'package:aislecheck/features/shop_detail/models/available_stock_model.dart';
import 'package:aislecheck/features/shop_detail/models/review_model.dart';
import 'package:aislecheck/features/shopping_list/models/scheduled_product.dart';
import 'package:aislecheck/features/shopping_list/models/shopping_list_model.dart';
import 'package:aislecheck/features/wallet/models/notification_model.dart';

abstract class AppDummyData {
  static const stockItems = [
    StockModel(
        image: CustmoerImages.shop,
        name: 'Sephore',
        price: '17.00',
        reviews: '4.5'),
    StockModel(
        image: CustmoerImages.shop,
        name: 'Sephore',
        price: '17.00',
        reviews: '4.5'),
    StockModel(
        image: CustmoerImages.shop,
        name: 'Sephore',
        price: '17.00',
        reviews: '4.5'),
    StockModel(
        image: CustmoerImages.shop,
        name: 'Sephore',
        price: '17.00',
        reviews: '4.5'),
    StockModel(
        image: CustmoerImages.shop,
        name: 'Sephore',
        price: '17.00',
        reviews: '4.5'),
    StockModel(
        image: CustmoerImages.shop,
        name: 'Sephore',
        price: '17.00',
        reviews: '4.5'),
    StockModel(
        image: CustmoerImages.shop,
        name: 'Sephore',
        price: '17.00',
        reviews: '4.5'),
    StockModel(
        image: CustmoerImages.shop,
        name: 'Sephore',
        price: '17.00',
        reviews: '4.5'),
    StockModel(
        image: CustmoerImages.shop,
        name: 'Sephore',
        price: '17.00',
        reviews: '4.5'),
    StockModel(
        image: CustmoerImages.shop,
        name: 'Sephore',
        price: '17.00',
        reviews: '4.5'),
    StockModel(
        image: CustmoerImages.shop,
        name: 'Sephore',
        price: '17.00',
        reviews: '4.5'),
  ];
  static const reviews = [
    ReviewModel(
        image: CustmoerImages.shop,
        name: 'User name',
        date: '21st September 2023',
        reviewText:
            'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?',
        totalStars: 3),
    ReviewModel(
        image: CustmoerImages.shop,
        name: 'User name',
        date: '21st September 2023',
        reviewText:
            'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues',
        totalStars: 5),
    ReviewModel(
        image: CustmoerImages.shop,
        name: 'User name',
        date: '21st September 2023',
        reviewText:
            'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.',
        totalStars: 2),
    ReviewModel(
        image: CustmoerImages.shop,
        name: 'User name',
        date: '21st September 2023',
        reviewText:
            'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human',
        totalStars: 1),
  ];
  static const shoppingLists = [
    ShoppingListModel(
        listName: 'Grocery List',
        totalItems: 10,
        totalCost: 100,
        progress: 50,
        lastUpdated: '2 days'),
    ShoppingListModel(
        listName: 'Grocery List',
        totalItems: 10,
        totalCost: 100,
        progress: 50,
        lastUpdated: '2 days'),
    ShoppingListModel(
        listName: 'Grocery List',
        totalItems: 10,
        totalCost: 100,
        progress: 50,
        lastUpdated: '2 days'),
    ShoppingListModel(
        listName: 'Grocery List',
        totalItems: 10,
        totalCost: 100,
        progress: 50,
        lastUpdated: '2 days'),
    ShoppingListModel(
        listName: 'Grocery List',
        totalItems: 10,
        totalCost: 100,
        progress: 50,
        lastUpdated: '2 days'),
  ];
  static const scheduledProductsList = [
    ScheduledProduct(
        image: CustmoerImages.shop,
        productName: 'Item name',
        quantity: 10,
        price: 10),
    ScheduledProduct(
        image: CustmoerImages.shop,
        productName: 'Item name',
        quantity: 10,
        price: 10),
    ScheduledProduct(
        image: CustmoerImages.shop,
        productName: 'Item name',
        quantity: 10,
        price: 10),
    ScheduledProduct(
        image: CustmoerImages.shop,
        productName: 'Item name',
        quantity: 10,
        price: 10),
    ScheduledProduct(
        image: CustmoerImages.shop,
        productName: 'Item name',
        quantity: 10,
        price: 10),
    ScheduledProduct(
        image: CustmoerImages.shop,
        productName: 'Item name',
        quantity: 10,
        price: 10),
    ScheduledProduct(
        image: CustmoerImages.shop,
        productName: 'Item name',
        quantity: 10,
        price: 10),
    ScheduledProduct(
        image: CustmoerImages.shop,
        productName: 'Item name',
        quantity: 10,
        price: 10),
    ScheduledProduct(
        image: CustmoerImages.shop,
        productName: 'Item name',
        quantity: 10,
        price: 10),
    ScheduledProduct(
        image: CustmoerImages.shop,
        productName: 'Item name',
        quantity: 10,
        price: 10),
    ScheduledProduct(
        image: CustmoerImages.shop,
        productName: 'Item name',
        quantity: 10,
        price: 10),
    ScheduledProduct(
        image: CustmoerImages.shop,
        productName: 'Item name',
        quantity: 10,
        price: 10),
  ];

  static const availableStockItems = [
    AvailableStockModel(
        image: CustmoerImages.shop,
        productName: 'Product Name',
        currentStock: 100,
        lastUpdated: '2 days',
        stockSituation: ''),
    AvailableStockModel(
        image: CustmoerImages.shop,
        productName: 'Product Name',
        currentStock: 100,
        lastUpdated: '2 days',
        stockSituation: 'Low on Stock'),
    AvailableStockModel(
        image: CustmoerImages.shop,
        productName: 'Product Name',
        currentStock: 100,
        lastUpdated: '2 days',
        stockSituation: ''),
    AvailableStockModel(
        image: CustmoerImages.shop,
        productName: 'Product Name',
        currentStock: 100,
        lastUpdated: '2 days',
        stockSituation: ''),
  ];

  static const adsList = [
    AdModel(
      image: 'assets/images/admin_images/grocery_ad.png',
      description: 'Lorem ispum is simply dummy text of',
      status: 'Active',
    ),
    AdModel(
      image: 'assets/images/admin_images/shop_ad.png',
      description: 'Lorem ispum is simply dummy text of',
      status: 'Not Active',
    ),
    AdModel(
      image: 'assets/images/admin_images/grocery_ad.png',
      description: 'Lorem ispum is simply dummy text of',
      status: 'Active',
    ),
  ];
  static const List<TopForecastingModel> topForecastingModel = [
    TopForecastingModel(whichDay: 0, value: 40),
    TopForecastingModel(whichDay: 1, value: 50),
    TopForecastingModel(whichDay: 2, value: 30),
    TopForecastingModel(whichDay: 3, value: 60),
    TopForecastingModel(whichDay: 4, value: 80),
    TopForecastingModel(whichDay: 5, value: 40),
    TopForecastingModel(whichDay: 6, value: 60),
  ];

  static const List<LowerForecastingModel> lowerForecastingModel = [
    LowerForecastingModel(whichDay: 0, value: 10),
    LowerForecastingModel(whichDay: 1, value: 20),
    LowerForecastingModel(whichDay: 2, value: 50),
    LowerForecastingModel(whichDay: 3, value: 30),
    LowerForecastingModel(whichDay: 4, value: 20),
    LowerForecastingModel(whichDay: 5, value: 5),
    LowerForecastingModel(whichDay: 6, value: 35),
  ];
  static const messages = [
    {"isMe": false, "text": "Hey What is up with you!!", "time": "10:00 am"},
    {"isMe": true, "text": "im fine,wbu?", "time": "11:00 am"},
    {"isMe": false, "text": "Hello!", "time": "11:01 am"},
    {
      "isMe": false,
      "text": "Just messaged cuz I had some work.",
      "time": "11:01 am"
    },
    {
      "isMe": true,
      "text": "Hello, how are you doing today...",
      "time": "11:03 am"
    },
    {
      "isMe": false,
      "text": "haha I wanted you to check out my new channel ^^",
      "time": "11:04 am"
    },
    {
      "isMe": true,
      "text": " Sure, what is the channel name?",
      "time": "11:05 am"
    },
    {
      "isMe": false,
      "text": "Rivaan Ranawat",
      "time": "11:06 am",
    },
    {
      "isMe": true,
      "text": "Looks great to me!",
      "time": "11:15 am",
    },
    {"isMe": false, "text": "Thanks bro!", "time": "11:17 am"},
    {"isMe": false, "text": "Did you subscribe?", "time": "11:16 am"},
    {"isMe": true, "text": "Yes, surely bro!", "time": "11:17 am"},
    {
      "isMe": false,
      "text": "Cool, did you like the content?",
      "time": "11:18 am",
    },
    {
      "isMe": true,
      "text": "I loved it?",
      "time": "11:19 am",
    },
    {
      "isMe": false,
      "text": "OMG! Woah! Thanks!",
      "time": "11:20 am",
    },
  ];
  static const recentsList = [
    RecentChatModel(
      image: AdminImages.barryChat,
      name: 'Barry',
    ),
    RecentChatModel(
      image: AdminImages.lisaChat,
      name: 'Lisa',
    ),
    RecentChatModel(
      image: AdminImages.perezChat,
      name: 'Perez',
    ),
    RecentChatModel(
      image: AdminImages.lisaChat,
      name: 'Lisa',
    ),
    RecentChatModel(
      image: AdminImages.barryChat,
      name: 'Barry',
    ),
    RecentChatModel(
      image: AdminImages.perezChat,
      name: 'Perez',
    ),
    RecentChatModel(
      image: AdminImages.barryChat,
      name: 'Barry',
    ),
    RecentChatModel(
      image: AdminImages.lisaChat,
      name: 'Lisa',
    ),
    RecentChatModel(
      image: AdminImages.perezChat,
      name: 'Perez',
    ),
    RecentChatModel(
      image: AdminImages.lisaChat,
      name: 'Lisa',
    ),
    RecentChatModel(
      image: AdminImages.barryChat,
      name: 'Barry',
    ),
  ];
  static final recentChatContactsList = [
    ChatContactModel(
      image: AdminImages.barryChat,
      username: 'Username',
      lastMessage: 'dannylove@gmail.com',
      time: DateTime.now(),
    ),
    ChatContactModel(
      image: AdminImages.lisaChat,
      username: 'Username',
      lastMessage: 'Uploaded file',
      time: DateTime.now(),
    ),
    ChatContactModel(
      image: AdminImages.perezChat,
      username: 'Username',
      lastMessage: 'will do, super, thank you',
      time: DateTime.now(),
    ),
    ChatContactModel(
      image: AdminImages.lisaChat,
      username: 'Username',
      lastMessage: 'dannylove@gmail.com',
      time: DateTime.now(),
    ),
    ChatContactModel(
      image: AdminImages.barryChat,
      username: 'Username',
      lastMessage: 'dannylove@gmail.com',
      time: DateTime.now(),
    ),
    ChatContactModel(
      image: AdminImages.lisaChat,
      username: 'Username',
      lastMessage: 'dannylove@gmail.com',
      time: DateTime.now(),
    ),
    ChatContactModel(
      image: AdminImages.perezChat,
      username: 'Username',
      lastMessage: 'dannylove@gmail.com',
      time: DateTime.now(),
    ),
  ];
  static final notifications = [
    NotificationModel(
      backgroundColor: AppColors.greenColor,
      title: '"username" has scheduled a product',
      text: 'the amount was added by ""username',
      time: DateTime.now(),
    ),
    NotificationModel(
      backgroundColor: AppColors.greenColor,
      title: '\$100 has been added',
      text: 'the amount was added by ""username"',
      time: DateTime.now(),
    ),
    NotificationModel(
      backgroundColor: AppColors.blueColor,
      title: '\$100 has been withdraw',
      text: 'the amount was added by ""username"',
      time: DateTime.now(),
    ),
    NotificationModel(
      backgroundColor: AppColors.redColor,
      title: '\$100 has been detected',
      text: 'the amount was added by ""username"',
      time: DateTime.now(),
    ),
    NotificationModel(
      backgroundColor: AppColors.greenColor,
      title: '\$100 has been added',
      text: 'the amount was added by ""username"',
      time: DateTime.now(),
    ),
    NotificationModel(
      backgroundColor: AppColors.blueColor,
      title: '\$100 has been withdraw',
      text: 'the amount was added by ""username"',
      time: DateTime.now(),
    ),
    NotificationModel(
      backgroundColor: AppColors.redColor,
      title: '\$100 has been detected',
      text: 'the amount was added by ""username"',
      time: DateTime.now(),
    ),
    NotificationModel(
      backgroundColor: AppColors.greenColor,
      title: '\$100 has been added',
      text: 'the amount was added by ""username"',
      time: DateTime.now(),
    ),
    NotificationModel(
      backgroundColor: AppColors.blueColor,
      title: '\$100 has been withdraw',
      text: 'the amount was added by ""username"',
      time: DateTime.now(),
    ),
    NotificationModel(
      backgroundColor: AppColors.redColor,
      title: '\$100 has been detected',
      text: 'the amount was added by ""username"',
      time: DateTime.now(),
    ),
  ];
}
