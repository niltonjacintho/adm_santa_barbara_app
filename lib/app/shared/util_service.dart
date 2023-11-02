import 'package:admFlutter/app/shared/cores.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';

// class Igreja {
//   String nome = '';
//   String forania = '';
// }

class UtilService extends Disposable {
  //dispose will be called automatically
  @override
  void dispose() {}

  String validateEmail(String value) {
    print('entrou');
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Email inválido';
    else
      return null;
  }

  String validatePass(String value) {
    if (value.length < 6)
      return 'É necessário no mínimo 6 caracteres';
    else
      return null;
  }

  String validateRequired(String value) {
    if ((value != null) && (value.length == 0))
      return 'Este campo é obrigatório';
    else
      return null;
  }

  toast(String value) {
    Fluttertoast.showToast(
        msg: value,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 10,
        backgroundColor: Colors.red,
        webBgColor: Cores().toastErrorColor,
        textColor: Colors.white,
        webShowClose: true,
        fontSize: 16.0);
  }

  InputDecoration getInputDecoration({String label = '', String hint = ''}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      contentPadding: EdgeInsets.all(2),
      isDense: true,
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.red[400])),

      //border: InputBorder.none
    );
  }

  // extractDataFromHtml(String htmlParoquia) {
  //   htmlParoquia =
  //       '<p><b>Paróquia Anunciação a Nossa Senhora</b><br>4ª Forania do Vicariato Episcopal Norte <br>Data de  criação: 08/09/1973<br><br>Rua        Frei Pinto, 27 - Riachuelo<br>20950-140 - Rio de Janeiro - RJ<br>Telefones: (21)2501-0299<br><br>Código: 3002</p><ul style="font-size: 13px;"><li>Pároco - Padre Rogério Pereira da Silva</li><li>Vigário Paroquial - Padre Edilson Roberto da Silva</li><li>Exercício do Ministério - Diácono Eudásio Marques Rodrigues</li></ul><p> <b>Locais de culto</b><ul><li>Igreja Matriz Anunciação a Nossa Senhora                &nbsp;<a href="javascript:exibirImagem(3,\'DIV3\')"><img src="img/camera.PNG"/></a>                <div style="display:none;" id="DIV3"></div>                <br/>Rua        Frei Pinto, 27 - Riachuelo<br>20950-140 - Rio de Janeiro, RJ<br/>Tel(s): (21)2501-0299<br/></li><li>Imaculada Conceição (FEM 014)<br/>Rua        São Francisco Xavier, 935 - São Francisco Xavier<br>20550-017 - Rio de Janeiro, RJ<br/>Tel(s): (21)2264-4998<br/></li><li>Nossa Senhora Aparecida<br/>Rua        Marechal Bittencourt, 112 - Riachuelo<br>20950-200 - Rio de Janeiro, RJ<br/></li><li>Nossa Senhora das Graças<br/>Rua        24 de Maio, 382 - Riachuelo<br>20950-090 - Rio de Janeiro, RJ<br/></li><li>Nossa Senhora do Rosário<br/>Rua        Manaus, casa 4-A - Morro do Queto - Rio de Janeiro, RJ<br/></li><li>Santo Antônio (Irmandade)<br/>Rua        Filgueiras Lima, 145 - Riachuelo<br>20950-050 - Rio de Janeiro, RJ<br/></li><li>São Jorge e São Geraldo<br/>Avenida    Marechal Rondon, 1.478 - Riachuelo<br>20950-001 - Rio de Janeiro, RJ<br/></li></ul>';
  //   Igreja obj = new Igreja();
  //   obj.nome = hp.substring(hp.indexOf('<b>') + 3, hp.indexOf('</b>'));
  //   hp = hp.substring(hp.indexOf('</b>') + 4);
  //   // print (hp);
  //   obj.forania = hp.substring(
  //       hp.indexOf('<br>') + 4, hp.indexOf('<br>', hp.indexOf('<br>') + 3));
  //   print(obj.nome);
  //   print(obj.forania);
  // }

  Widget crudButtons(Function gravar, Function excluir,
      {String labelGravar = 'Gravar',
      String labelCancelar = 'Cancelar',
      String labelExcluir = 'Excluir',
      bool showGravar = true,
      showExcluir = true,
      showCancelar = true}) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
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
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)),
            label: Text(
              labelGravar,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              gravar();
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
              labelExcluir,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              excluir();
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
              labelCancelar,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              Modular.to.pop();
            },
          ),
        ],
      ),
    );
  }

  Widget header(String subTitulo, {String titulo = 'Paróquia Santa Bárbara'}) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: <Widget>[
            Align(alignment: Alignment.centerLeft, child: Text(titulo)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(subTitulo, style: new TextStyle(fontSize: 10)),
            ),
          ],
        ),
      ),
    );
  }
}
