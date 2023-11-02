import 'package:admFlutter/app/modules/agenda/agenda_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:admFlutter/app/modules/agenda/agenda_page.dart';

class AgendaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AgendaController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => AgendaPage()),
      ];

  static Inject get to => Inject<AgendaModule>.of();
}
