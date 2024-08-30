import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/inventry_scheduling/views/widgets/date_tile_widget.dart';
import 'package:aislecheck/features/schedule_item/views/widgets/item_widgets.dart';
import 'package:flutter/material.dart';

class InventrySchedulingPage extends StatelessWidget {
  const InventrySchedulingPage({super.key});
  static const name = '/inventrySchedulingPage';
  static const String _heading = 'Schedule your inventory update';
  static const _contentPadding = 0.05;
  static const _fiveFlex = 5;
  static const _twentyFlex = 20;
  static const _tenFlex = 10;
  @override
  Widget build(BuildContext context) {
    final Size(
      :width,
    ) = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: GlobalAppBar(titleText: 'Ads'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * _contentPadding),
        child: Column(
          children: [
            const Spacer(
              flex: _fiveFlex,
            ),
            const Expanded(
              flex: _twentyFlex,
              child: DatePickingWidget(
                dateText: _heading,
              ),
            ),
            const Expanded(
              flex: _tenFlex,
              child: TimePickingWidget(
                selectTime: '',
              ),
            ),
            const Spacer(
              flex: _fiveFlex,
            ),
            const Expanded(
              flex: _tenFlex,
              child: DateTile(),
            ),
            const Spacer(
              flex: _fiveFlex,
            ),
            Expanded(
              flex: _tenFlex,
              child: AdminAppCompactTextField(
                controller: TextEditingController(),
                hintText: 'Enter Verfication code',
                validator: (value) {
                  return null;
                },
              ),
            ),
            const Spacer(
              flex: _twentyFlex,
            ),
            Expanded(
              flex: _tenFlex,
              child: AppCompactBtn(
                onTap: () {
                  context.showPopUpMsg('confirm');
                },
                btnName: 'Confirm',
              ),
            ),
            const Spacer(
              flex: _fiveFlex,
            )
          ],
        ),
      ),
    );
  }
}
