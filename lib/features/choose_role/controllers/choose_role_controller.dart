import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'choose_role_controller.g.dart';
@riverpod
class ChooseRoleNotifier extends _$ChooseRoleNotifier {
  @override
 (bool,bool) build() {
    return (false, false);
  }

  void chooseRole({required bool userRole, required bool adminRole}) {
    state = (userRole, adminRole);
  }
}
