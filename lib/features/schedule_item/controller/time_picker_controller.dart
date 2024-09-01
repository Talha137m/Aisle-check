import 'package:aislecheck/config/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'time_picker_controller.g.dart';

@riverpod
class ScheduleItemTimePickerNotifier extends _$ScheduleItemTimePickerNotifier {
  @override
  FutureOr<String> build() async {
    return 'time';
  }

  void getTime(BuildContext context) async {
    TimeOfDay? timeOfDay = await showTimePicker(
      context: NavigationState.navigatorKey.currentState!.context,
      initialTime: TimeOfDay.now(),
    );
    if (timeOfDay == null) {
      state = AsyncValue.error('time is not selected', StackTrace.current);
    } else {
      if (!context.mounted) return;
      String formatedTime = timeOfDay.format(context);
      state = AsyncValue.data(formatedTime);
    }
  }
}
