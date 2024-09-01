import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_bottom_controller.g.dart';

@riverpod
class UserBottomNavigationNotifier extends _$UserBottomNavigationNotifier {
  @override
  int build() {
    return 2;
  }

  void navigation(int index) {
    state = index;
  }
}
