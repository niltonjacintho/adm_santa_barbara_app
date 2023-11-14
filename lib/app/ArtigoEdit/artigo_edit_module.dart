import 'package:flutter_modular/flutter_modular.dart';

import 'artigo_edit_page.dart';

class ArtigoEditModule extends ChildModule {
  @override
  List<Bind> get binds => [
      //  $ArtigoEditController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ArtigoEditPage()),
      ];

  static Inject get to => Inject<ArtigoEditModule>.of();
}
