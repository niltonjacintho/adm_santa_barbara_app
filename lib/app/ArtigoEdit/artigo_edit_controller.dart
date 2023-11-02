import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'artigo_edit_controller.g.dart';

@Injectable()
class ArtigoEditController = _ArtigoEditControllerBase
    with _$ArtigoEditController;

abstract class _ArtigoEditControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
