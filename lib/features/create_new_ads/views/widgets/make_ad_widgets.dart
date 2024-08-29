import 'package:aislecheck/core/common/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class ToAndFromFieldsRow extends StatelessWidget {
  const ToAndFromFieldsRow({super.key});
  //....CONSTANT VALUES
  static const _toHint = 'To';
  static const _fromHint = 'From';
  static const _fieldWidth = 0.4;
  static const _pointZeroTwoFivePercent = 0.025;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Expanded(
            child: Center(
          child: AdminAppCompactTextField(
            controller: TextEditingController(),
            hintText: _fromHint,
            validator: (value) {
              return null;
            },
            prefix: Icon(
              Icons.calendar_today_outlined,
              size: height * _pointZeroTwoFivePercent,
            ),
            fieldWidth: _fieldWidth,
          ),
        )),
        Expanded(
            child: Center(
          child: AdminAppCompactTextField(
            controller: TextEditingController(),
            hintText: _toHint,
            validator: (value) {
              return null;
            },
            prefix: Icon(
              Icons.calendar_today_outlined,
              size: height * _pointZeroTwoFivePercent,
            ),
            fieldWidth: _fieldWidth,
          ),
        ))
      ],
    );
  }
}
