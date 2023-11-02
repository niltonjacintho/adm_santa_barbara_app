import 'package:admFlutter/app/modules/listadocumentos/listadocumentos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:admFlutter/app/modules/listadocumentos/listadocumentos_page.dart';

class ListadocumentosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ListadocumentosController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ListadocumentosPage()),
      ];

  static Inject get to => Inject<ListadocumentosModule>.of();
}
