import 'package:mobx/mobx.dart';

part 'listadocumentos_controller.g.dart';

class ListadocumentosController = _ListadocumentosControllerBase
    with _$ListadocumentosController;

abstract class _ListadocumentosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
