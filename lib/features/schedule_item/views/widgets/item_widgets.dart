import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/schedule_item/controller/date_controller.dart';
import 'package:aislecheck/features/schedule_item/controller/time_picker_controller.dart';
//import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/constants/strings/app_colors.dart';

//........ITEM INFORMATION
class ItemInfo extends StatelessWidget {
  const ItemInfo(
      {super.key,
      required this.image,
      required this.productDescp,
      required this.productName,
      required this.price});
  final String image, productName, productDescp;
  final num price;
  //....CONSTANT VALUES
  static const _pointZeroTwoPercent = 0.02;
  static const _pointOnePercent = 0.1;
  static const _pointTwoFivePercent = 0.25;
  static const _imageBorderRadius = 10.0;
  static const _fontSizeSixteen = 16.0;
  static const _fontSizeEighteen = 18.0;
  static const _fontSizeTen = 10.0;
  //....CONSTANT FLEX SIZES
  static const _flexOne = 1;
  static const _flexTwo = 2;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Expanded(
          flex: _flexOne,
          child: Center(
            child: SizedBox(
              height: height * _pointOnePercent,
              width: width * _pointTwoFivePercent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  _imageBorderRadius,
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: _flexTwo,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * _pointZeroTwoPercent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                Expanded(
                  flex: _flexOne,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: _flexTwo,
                        child: Text(
                          productName,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: _fontSizeSixteen,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: _flexOne,
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '\$$price',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                fontSize: _fontSizeEighteen,
                                color: AppColors.blackColor,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: _flexOne,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map_outlined,
                          size: height * _pointZeroTwoPercent,
                        ),
                        Expanded(
                            child: Text(
                          productDescp,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: _fontSizeTen,
                            color: AppColors.grayColor,
                          ),
                        ))
                      ],
                    )),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//.....CALENDAR Widget
class DatePickingWidget extends ConsumerWidget {
  final String dateText;
  const DatePickingWidget({super.key, this.dateText = _selectDataText});
  //...CONSTANT VALUES
  static const _selectDataText = 'Select date to pick up your item';
  static const _fontSize = 15.0;
  static const _propsHeightAndWidth = 0.03;
  // //....RUNTIME CONSTANTS
  // EasyInfiniteDateTimelineController get calendarController =>
  //     EasyInfiniteDateTimelineController();
  // //....VARIABLES
  // static DateTime _focusedDate = DateTime.now();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime dateTime = ref.watch(scheduleItemDateNotifierProvider);
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dateText,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: _fontSize,
          ),
        ),
        SizedBox(
          height: height * _propsHeightAndWidth,
        ),
        Expanded(
          child: TableCalendar(
            headerVisible: false,
            rowHeight: 40,
            calendarFormat: CalendarFormat.twoWeeks,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            calendarStyle: const CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: AppColors.ratingStartColor,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: const HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
            ),
            selectedDayPredicate: (day) {
              return isSameDay(dateTime, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              ref
                  .read(scheduleItemDateNotifierProvider.notifier)
                  .onDateChange(dateTime);
              // context.read<DateController>().onDateChange(selectedDay);
              context.showPopUpMsg(selectedDay.toString(), seconds: 20);
            },
          ),
        ),
      ],
    );
  }
}

//.....TIME PICKING WIDGET
class TimePickingWidget extends ConsumerWidget {
  final String time;
  final String selectTime;
  const TimePickingWidget(
      {super.key, this.time = 'Time', this.selectTime = _selectDataText});
//...CONATNT VALUES
  static const _selectDataText = 'Select your time';

  static const _timeFontSize = 13.0;
  static const _fontSize = 15.0;
  static const _borderWidth = 0.0;
  static const _borderRadius = 30.0;
  static const _pointZeroThree = 0.03;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size(:height) = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          selectTime,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: _fontSize,
            color: AppColors.black54Color,
          ),
        ),
        Expanded(
          child: Center(
            child: ListTile(
              onTap: () {
                ref
                    .watch(scheduleItemTimePickerNotifierProvider.notifier)
                    .getTime(context);
              },
              leading: Icon(
                Icons.access_time_rounded,
                color: AppColors.blackColor,
                size: height * _pointZeroThree,
              ),
              title: Text(
                time,
                style: GoogleFonts.roboto(
                  color: AppColors.blackColor,
                  fontSize: _timeFontSize,
                ),
              ),
              shape: ContinuousRectangleBorder(
                side: const BorderSide(
                  color: AppColors.greenColor,
                  width: _borderWidth,
                ),
                borderRadius: BorderRadius.circular(
                  _borderRadius,
                ),
              ),
              selected: true,
              selectedTileColor: AppColors.lightGreenColor,
            ),
          ),
        )
      ],
    );
  }
}
