import 'package:mobx/mobx.dart';

part 'documentosedit_controller.g.dart';

class DocumentoseditController = _DocumentoseditControllerBase
    with _$DocumentoseditController;

abstract class _DocumentoseditControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
