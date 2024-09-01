import 'package:aislecheck/core/constants/enumration/enumrations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'stats_controller.g.dart';


@riverpod
class StatsNotifier extends _$StatsNotifier {
  @override
 String build() {
  return StatsEnumuration.currentStats.name;
  }
    void statsOption(String value) {
    state = value;
  }
  
}