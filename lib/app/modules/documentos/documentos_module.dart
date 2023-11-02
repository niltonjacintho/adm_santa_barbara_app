import 'package:admFlutter/app/modules/documentos/documentos_controller.dart';
import 'package:admFlutter/app/modules/documentosedit/documentosedit_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:admFlutter/app/modules/documentos/documentos_page.dart';

class DocumentosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DocumentosController()),
        Bind((i) => DocumentoseditController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => DocumentosPage()),
      ];

  static Inject get to => Inject<DocumentosModule>.of();
}
