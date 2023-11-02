import 'package:mobx/mobx.dart';

part 'agendaedit_controller.g.dart';

class AgendaeditController = _AgendaeditControllerBase
    with _$AgendaeditController;

abstract class _AgendaeditControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
