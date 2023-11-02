import 'package:mobx/mobx.dart';

part 'pastoraisedit_controller.g.dart';

class PastoraiseditController = _PastoraiseditControllerBase
    with _$PastoraiseditController;

abstract class _PastoraiseditControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
