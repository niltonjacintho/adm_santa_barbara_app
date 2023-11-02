import 'package:admFlutter/app/modules/documentosedit/documentosedit_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:admFlutter/app/modules/documentosedit/documentosedit_page.dart';

class DocumentoseditModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DocumentoseditController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => DocumentoseditPage()),
      ];

  static Inject get to => Inject<DocumentoseditModule>.of();
}
