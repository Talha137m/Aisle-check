import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/schedule_item/controller/time_picker_controller.dart';
import 'package:aislecheck/features/schedule_item/views/widgets/item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class ScheduleItemPage extends StatelessWidget {
  const ScheduleItemPage({super.key});
  //...PAGE NAME
  static const pageName = '/item_details';
  //...CONSTANT VALUES
  static const _btnText = 'Check now';
  static const _heading = 'Check out item';
  static const _btnRadius = 30.0;
  static const _btnHeight = 0.07;
  static const _contentPadding = 0.05;
  static const _fontSize = 20.0;
  //CONSTANT FLEZ SIZES
  static const _flexOne = 1;
  static const _flexTwo = 2;
  static const _flexThree = 3;
  @override
  Widget build(BuildContext context) {
    var state = context.watch<TimePickerController>();
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: GlobalAppBar(titleText: 'Ads',),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: width * _contentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: _flexOne,
              child: Text(
                _heading,
                style: GoogleFonts.roboto(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: _fontSize,
                ),
              ),
            ),
            const Expanded(
              flex: _flexTwo,
              child: ItemInfo(
                image: CustmoerImages.shop,
                price: 100,
                productDescp: 'Lorem ispum is simply dummy text of',
                productName: 'Product name',
              ),
            ),
            const Spacer(),
            const Expanded(
              flex: _flexThree,
              child: DatePickingWidget(),
            ),
            Expanded(
              flex: _flexTwo,
              child: Builder(builder: (context) {
                //....choose the time picker to show the time
                if (state.initialState) {
                  return const TimePickingWidget();
                } else if (state.loadedState) {
                  return TimePickingWidget(
                    time: state.time,
                  );
                } else if (state.loadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  context.showPopUpMsg(state.errorMessage);
                  return const TimePickingWidget();
                }
              }),
            ),
            const Spacer(
              flex: _flexTwo,
            ),
            Expanded(
              flex: _flexTwo,
              child: Center(
                child: AppCompactBtn(
                  onTap: () {
                    context.showPopUpMsg('Checked Out');
                  },
                  borderRadius: _btnRadius,
                  btnHeight: _btnHeight,
                  btnName: _btnText,
                  isTextBold: true,
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
