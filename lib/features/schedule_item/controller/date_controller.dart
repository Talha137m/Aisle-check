import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date_controller.g.dart';
@riverpod
class ScheduleItemDateNotifier extends _$ScheduleItemDateNotifier {
  @override
  DateTime build() {
    return DateTime.now();
  }
  void onDateChange(DateTime dateTime) {
    state = dateTime;
  }
}
