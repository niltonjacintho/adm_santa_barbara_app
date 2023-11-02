import 'package:admFlutter/app/modules/pastorais/pastorais_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:admFlutter/app/modules/pastorais/pastorais_page.dart';

class PastoraisModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PastoraisController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => PastoraisPage()),
      ];

  static Inject get to => Inject<PastoraisModule>.of();
}
