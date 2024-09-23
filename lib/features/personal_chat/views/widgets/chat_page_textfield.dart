import 'package:aislecheck/config/navigation/routes.dart';
import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/auth/admin_auth/models/add_admin_model.dart';
import 'package:aislecheck/features/personal_chat/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PersonalChatTextFieldAndButton extends StatelessWidget {
  final AdminModel adminModel;
  const PersonalChatTextFieldAndButton({super.key, required this.adminModel});
  //.....CONSTANT VALUES
  static const _borderRadius = 40.0;
  //.....CONSTANT FLEX SIZES
  static const _flexEight = 8;
  static const _flexTwo = 2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: _flexEight,
          child: Center(
              child: ChatTextField(
            textEditingController:
                context.read<ChatController>().messageController,
          )),
        ),
        Expanded(
          flex: _flexTwo,
          child: Center(
            child: FloatingActionButton(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(
                  _borderRadius,
                ),
              ),
              backgroundColor: AppColors.greenColor,
              onPressed: () {
                context.read<ChatController>().sendMessages(adminModel.adminId);
              },
              child: Image.asset(
                AdminImages.sendIcon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//.....CHAT TEXT FIELD
class ChatTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  const ChatTextField({super.key, required this.textEditingController});
  //....CONSTANT VALUES
  static const _hintText = 'Type something...';
  static const _pointSevenPercent = 0.7;
  static const _pointEightPercent = 0.95;
  static const _fontSizeThirteen = 13.0;
  //....DECORATION
  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(
      color: Colors.transparent,
      width: 1.0,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final BoxConstraints(:maxHeight, :maxWidth) = constraints;
        return SizedBox(
          width: maxWidth * _pointEightPercent,
          height: maxHeight * _pointSevenPercent,
          child: TextFormField(
            controller: textEditingController,
            expands: true,
            maxLines: null,
            style: GoogleFonts.roboto(
              color: AppColors.blackColor,
              fontSize: _fontSizeThirteen,
            ),
            decoration: InputDecoration(
                fillColor: AppColors.lightGreenColor,
                filled: true,
                border: _border,
                focusedBorder: _border,
                enabledBorder: _border,
                hintText: _hintText,
                hintStyle: GoogleFonts.roboto(
                  color: AppColors.grayColor,
                  fontSize: _fontSizeThirteen,
                )),
          ),
        );
      },
    );
  }
}
