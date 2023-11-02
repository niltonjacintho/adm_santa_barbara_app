import 'dart:html' as html;
import 'package:admFlutter/app/modules/documentos/documentos_controller.dart';
import 'package:admFlutter/app/shared/cores.service.dart';
import 'package:admFlutter/app/shared/grupos_service.dart';
import 'package:admFlutter/app/shared/util_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_dropdown_formfield/material_dropdown_formfield.dart';
import 'documentosedit_controller.dart';

class DocumentoseditPage extends StatefulWidget {
  final String title;
  const DocumentoseditPage({Key key, this.title = "Documentosedit"})
      : super(key: key);

  @override
  _DocumentoseditPageState createState() => _DocumentoseditPageState();
}

class _DocumentoseditPageState
    extends ModularState<DocumentoseditPage, DocumentoseditController> {
  //use 'controller' variable to access controller
  // bool _autovalidate = false;
  final _formKey = GlobalKey<FormState>();
  DocumentosController documentosController = Modular.get();

  GruposService gruposService = Modular.get(); // new GruposService();
  //Image pickedImage;
  void _startFilePicker() async {
    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = '.png,.jpg';
    uploadInput.multiple = false;
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      // read file content as dataURL
      final files = uploadInput.files;
      if (files.length == 1) {
        final file = files[0];
        final reader = new html.FileReader();
        print('ARQUIVO LIDO ==> $file');
        documentosController.imageFile = file;
        reader.onLoadEnd.listen((e) {
          // _handleResult(reader.result);
        });
        reader.readAsDataUrl(file);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(documentosController.documentoAtivo);
    return Padding(
      padding: EdgeInsets.all(50),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RaisedButton.icon(
              icon: Icon(
                Icons.save,
                color: Colors.white,
                size: 30,
              ),
              elevation: 10,
              color: Cores().corOk,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.black),
              ),
              label: Text(
                'Gravar',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  await documentosController.gravar();
                  UtilService().toast('Documento gravado com êxito');
                  Modular.to.pop();
                } else {
                  setState(() {
                    // _autovalidate = true;
                  });
                }
              },
            ),
            RaisedButton.icon(
              icon: Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 30,
              ),
              elevation: 10,
              color: Cores().corOk,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.black),
              ),
              label: Text(
                'Apagar',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                await documentosController.apagar();
                UtilService().toast('Documento EXCLUIDO com êxito');
                Modular.to.pop();
              },
            ),
            RaisedButton.icon(
              icon: Icon(
                Icons.cancel,
                color: Colors.white,
                size: 30,
              ),
              elevation: 10,
              color: Cores().corOk,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.black),
              ),
              label: Text(
                'Cancelar',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                Modular.to.pop();
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  DropDownFormField(
                    titleText: 'Este documento é sobre?',
                    hintText: 'Escolha uma categoria por favor.',
                    // value: documentosController.documentoAtivo.grupo,
                    onSaved: (value) {
                      print('value on save $value');
                      setState(() {
                        documentosController.documentoAtivo.grupo = value;
                      });
                    },
                    onChanged: (value) {
                      print('value on change $value');
                      gruposService.getListGrupos();
                      setState(() {
                        documentosController.documentoAtivo.grupo = value;
                      });
                    },
                    dataSource: gruposService.getListGrupos(),
                    textField: 'display',
                    valueField: 'value',
                  ),
                  TextFormField(
                    initialValue: documentosController.documentoAtivo.titulo,
                    decoration: UtilService().getInputDecoration(
                        label: 'Informe o título', hint: 'Título'),
                    keyboardType: TextInputType.text,
                    validator: UtilService().validateRequired,
                    onSaved: (value) {
                      setState(() {
                        documentosController.documentoAtivo.titulo = value;
                      });
                    },
                  ),
                  TextFormField(
                    initialValue: documentosController.documentoAtivo.subtitulo,
                    decoration: UtilService().getInputDecoration(
                        label: 'Informe o subtítulo', hint: 'Sub Título'),
                    keyboardType: TextInputType.text,
                    validator: UtilService().validateRequired,
                    onSaved: (value) {
                      setState(() {
                        documentosController.documentoAtivo.subtitulo = value;
                      });
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    initialValue: documentosController.documentoAtivo.conteudo,
                    maxLines: 8,
                    decoration: UtilService()
                        .getInputDecoration(label: 'Informe o conteúdo'),
                    validator: UtilService().validateRequired,
                    onSaved: (value) {
                      setState(() {
                        documentosController.documentoAtivo.conteudo = value;
                      });
                    },
                  ),
                  Row(
                    children: [
                      RaisedButton.icon(
                        elevation: 8,
                        icon: Icon(
                          Icons.camera,
                          color: Colors.white,
                        ),
                        color: Cores().darkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.black),
                        ),
                        label: Text(
                          'Carregar imagem',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          _startFilePicker();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            //  ),
          ],
        ),
      ),
    );
  }
}
