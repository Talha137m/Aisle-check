import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'admin_bottom_controller.g.dart';

@riverpod
class AdminBottomNotifier extends _$AdminBottomNotifier {
  @override
  int build() {
    return 0;
  }

  void changeState(int index) {
    state = index;
  }
}
