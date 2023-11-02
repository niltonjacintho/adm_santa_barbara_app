import 'package:admFlutter/app/modules/pastorais/pastorais_controller.dart';
import 'package:admFlutter/app/shared/util_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
// import 'package:zefyr/zefyr.dart';

class PastoraiseditPage extends StatefulWidget {
  final String title;

  const PastoraiseditPage({Key key, this.title = "Pastoraisedit"})
      : super(key: key);

  @override
  _PastoraiseditPageState createState() => _PastoraiseditPageState();
}

final _formKey = GlobalKey<FormState>();
PastoraisController pastoraisController = Modular.get();
// bool _autovalidate = false;
void gravar() async {
  if (_formKey.currentState.validate()) {
    _formKey.currentState.save();
    await pastoraisController.gravar();
    UtilService().toast('Documento gravado com êxito');
    Modular.to.pop();
  } else {
    // setState(() {
    // _autovalidate = true;
    // });
  }
}

void excluir() async {
  await pastoraisController.apagar();
  pastoraisController.getPastorais();
  UtilService().toast('Documento EXCLUIDO com êxito');
  Modular.to.pop();
}

class _PastoraiseditPageState extends State<PastoraiseditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: UtilService().crudButtons(gravar, excluir),
      body: new Form(
        key: _formKey,
    autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                initialValue: pastoraisController.pastoralAtiva.titulo,
                decoration: UtilService().getInputDecoration(label: 'Título'),
                onChanged: (value) {
                  pastoraisController.pastoralAtiva.titulo = value;
                },
              ),
              TextFormField(
                initialValue: pastoraisController.pastoralAtiva.sigla,
                decoration: UtilService().getInputDecoration(label: 'Sigla'),
                onChanged: (value) {
                  pastoraisController.pastoralAtiva.sigla = value;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                initialValue: pastoraisController.pastoralAtiva.conteudo,
                decoration: UtilService()
                    .getInputDecoration(label: 'Fale sobre a pastoral'),
                maxLines: 12,
                onChanged: (value) {
                  pastoraisController.pastoralAtiva.conteudo = value;
                },
              ),
            ],
          ),
        ),
      ),
      //  ),
    );
  }
}
