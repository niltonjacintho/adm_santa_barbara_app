import 'package:admFlutter/app/ArtigoEdit/artigo_edit_controller.dart';
import 'package:admFlutter/app/ArtigoEdit/artigo_edit_module.dart';
import 'package:admFlutter/app/ArtigoEdit/artigo_edit_page.dart';
import 'package:admFlutter/app/modules/oracoes/oracoes_controller.dart';
import 'package:admFlutter/app/modules/pastorais/pastorais_controller.dart';
import 'package:admFlutter/app/modules/pastorais/pastorais_module.dart';
import 'package:admFlutter/app/pages/agendaedit/agendaedit_controller.dart';
import 'package:admFlutter/app/pages/pastoraisedit/pastoraisedit_controller.dart';
import 'package:admFlutter/app/modules/documentosedit/documentosedit_module.dart';
import 'package:admFlutter/app/pages/pastoraisedit/pastoraisedit_page.dart';
import 'package:admFlutter/app/shared/grupos_service.dart';
import 'package:admFlutter/app/modules/documentos/documentos_module.dart';
import 'package:admFlutter/app/modules/listadocumentos/listadocumentos_module.dart';
import 'package:admFlutter/app/shared/igreja.dart';
import 'package:admFlutter/app/shared/util_service.dart';
import 'package:admFlutter/app/modules/login/login_controller.dart';
import 'package:admFlutter/app/modules/login/login_module.dart';
import 'package:admFlutter/app/shared/auth_service.dart';
import 'package:admFlutter/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:admFlutter/app/app_widget.dart';
import 'package:admFlutter/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart' as m;

class AppModule extends m.MainModule {
  @override
  List<m.Bind> get binds => [
        m.Bind((i) => AgendaeditController()),
        m.Bind((i) => PastoraiseditController()),
        m.Bind((i) => AgendaeditController()),
        m.Bind((i) => ArtigoEditController()),
        m.Bind((i) => GruposService()),
        m.Bind((i) => UtilService()),
        m.Bind((i) => AuthService()),
        m.Bind((i) => AppController()),
        m.Bind((i) => PastoraisController()),
        m.Bind((i) => OracoesController()),
        m.Bind((i) => LoginController()),
        m.Bind((i) => CargaIgreja()),
      ];

  @override
  List<m.ModularRouter> get routers => [
        m.ModularRouter(m.Modular.initialRoute, module: LoginModule()),
        m.ModularRouter('/login', module: LoginModule()),
        m.ModularRouter('/home', module: HomeModule()),
        m.ModularRouter('/listadocumentos', module: ArtigoEditModule()),
        m.ModularRouter('/documentosEdit', module: DocumentoseditModule()),
        m.ModularRouter('/datatable', module: ListadocumentosModule()),
        m.ModularRouter('/listapastorais', module: PastoraisModule()),
        m.ModularRouter('/pastoraledit',
            child: (_, args) => PastoraiseditPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static m.Inject get to => m.Inject<AppModule>.of();
}
