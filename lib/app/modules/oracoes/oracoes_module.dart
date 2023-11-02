import 'oracoes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'oracoes_page.dart';

class OracoesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => OracoesController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => OracoesPage()),
      ];

  static Inject get to => Inject<OracoesModule>.of();
}
