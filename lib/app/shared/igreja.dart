import 'dart:core';
import 'package:admFlutter/app/models/igreja.model.dart';
import 'package:admFlutter/app/modules/documentos/documentos_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';

class paroquiasHttp {
  String nome = '';
  int id = 0;
}

class CargaIgreja {
  String urlBase = 'http://localhost/paroquias/curia';
  DocumentosController documentosController = Modular.get();
  List<int> paginas = []; // new List<int>();
  Igreja obj = new Igreja();
  List<Igreja> listaIgreja = []; //new List<Igreja>();
  String hp = '';
  void criar() async {
//
    print('vai montar');
    List placemark =
        await Geolocator().placemarkFromAddress("Gronausestraat 710, Enschede");
    print(placemark[0]);
    await montarArrayPaginas();
    print('montou list ${paginas.length}');
    await montarLista();
  }

  enviar() {
    listaIgreja.forEach((element) {
      // documentosController.gravarParoquias(element);
      print('BLOQUEI A GRAVAÇÃO');
    });
  }

  montarArrayPaginas() async {
    print('Montando Array');
    paginas = [];
    //new List<int>();
    final campoProcura = 'onclick="recuperaDetalhes(';
    int contador = 1;
    Response response =
        await Dio().get(urlBase + "/paroquias.php?pagina=$contador");
    String conteudo = response.data;
    print('Dados lidos $contador = $conteudo');
    while (conteudo.indexOf("panel panel-default") >= 0) {
      conteudo = conteudo.substring(conteudo.indexOf(campoProcura));
      while (conteudo.indexOf(campoProcura) >= 0) {
        var x = conteudo.substring(0, conteudo.indexOf(')'));
        paginas.add(int.parse(x.split(',')[1].replaceAll("'", "")));
        conteudo = conteudo.substring(20);
        try {
          conteudo = conteudo.substring(conteudo.indexOf(campoProcura));
        } catch (e) {
          conteudo = '';
        }
      }
      contador++;
      response = await Dio().get(urlBase + "/paroquias.php?pagina=$contador");
      conteudo = response.data;
      print(contador);
    }
  }

  montarLista() async {
    String url = '';
    Response response;
    paginas.forEach((element) async {
      url = urlBase + "/ajaxParoquiasRecuperarDetalhes.php?id=$element";
      response = await Dio().get(url);
      print(element);
      await gerar(response.data);
    });
  }

  gerar(String htmlParte) async {
    obj = new Igreja();
    obj.capelas = [];
    // new List<Capelas>();
    hp = htmlParte;
    obj.nome = hp.substring(hp.indexOf('<b>') + 3, hp.indexOf('</b>'));
    hp = hp.substring(hp.indexOf('</b>', 1) + 4);
    // print('HP antes de forania $hp');
    // print(hp);
    obj.forania = getParte('Forania');
    obj.nascimento = getParte('Nascimento');
    obj.endereco = getParte('Endereço');
    obj.endereco2 = getParte('Endereço2');
    obj.telefones = getParte('Telefones');
    print('Nome:        ${obj.nome}');
    print('Forânia:     ${obj.forania}');
    print('Nascimento:  ${obj.nascimento}');
    print('Endereço:    ${obj.endereco}');
    print('Endereço 2:  ${obj.endereco2}');
    print('Telefones:   ${obj.telefones}');
    await getParteLi();
    print('Pároco:      ${obj.paroco}');
    print('Diácono:     ${obj.diacono}');
    print('Vigário:     ${obj.vigario}');

// Teste de GeoLocation

    hp = hp.substring(hp.indexOf('Locais de culto'));
    // print('Locais $hp');
    await getCapelas();
    listaIgreja.add(obj);
    //documentosController.gravarParoquias(obj);
  }

  Future<String> getCapelas() {
    var x = hp.substring(hp.indexOf('<li>'), hp.indexOf('</li>'));
    while (x.indexOf('<li>') >= 0) {
      Capelas c = new Capelas();
      if (x.indexOf('<a') >= 0) {
        x = x.substring(0, x.indexOf('<a')) + x.substring(x.indexOf('<br/'));
      }
      c.nome = x
          .substring(x.indexOf('<li>') + 4, x.indexOf('<br/>'))
          .replaceAll('&nbsp;', '')
          .trim();

      try {
        x = x.substring(x.indexOf('<br/>'));
        c.endereco = x
            .substring(x.indexOf('<br/>') + 5, x.indexOf('<br>'))
            .replaceAll('&nbsp;', '')
            .trim();
      } catch (err) {
        c.endereco = '';
      }

      try {
        x = x.substring(x.indexOf('<br/>'));
        c.endereco = x
            .substring(x.indexOf('<br/>') + 5, x.indexOf('<br>'))
            .replaceAll('&nbsp;', '')
            .trim();
      } catch (err) {
        c.endereco = '';
      }

      try {
        x = x.substring(x.indexOf('<br>'));
        c.endereco2 = x
            .substring(x.indexOf('<br>') + 4, x.indexOf('<br/>'))
            .replaceAll('&nbsp;', '')
            .trim();
      } catch (err) {
        c.endereco2 = '';
      }

      try {
        x = x.substring(x.indexOf('<br/>'));
        c.telefone = x
            .substring(x.indexOf('<br/>') + 5, x.indexOf('<br/>', 1))
            .replaceAll('&nbsp;', '')
            .trim();
      } catch (err) {
        c.telefone = '';
      }

      print('Nome capela:        ${c.nome}');
      print('Endereço capela:    ${c.endereco}');
      print('Endereço capela2:   ${c.endereco2}');
      print('Endereço telefone:  ${c.telefone}');
      obj.capelas.add(c);
      try {
        hp = hp.substring(hp.indexOf('<li>', 1));
        x = hp.substring(hp.indexOf('<li>'), hp.indexOf('</li>'));
      } catch (err) {
        hp = '';
        x = '';
      }
    }
    Future<String> a;
    return a;
  }

  String getParte(String partName) {
    // print('$partName  Valor HP antes de pegar e apos o corte $hp');
    hp = hp.replaceAll('<br><br>', '<br>');
    // print(hp);
    // print('DENTRO DE GETPARTE $partName $hp');
    String x = hp.substring(
        hp.indexOf('<br>') + 4, hp.indexOf('<br>', hp.indexOf('<br>') + 3));
    hp = hp.substring(hp.indexOf('<br>', 1));
    return x;
  }

  Future<String> getParteLi() {
    print('VALOR DE HP ANTES DO ERRO $hp');
    var x = hp.substring(hp.indexOf('<li>'), hp.indexOf('<b>'));
    while (x.indexOf('<li>') >= 0) {
      String parte = x.substring(x.indexOf('<li>') + 4, x.indexOf('</li>'));
      if (parte.indexOf('Pároco') >= 0) {
        obj.paroco = parte.substring(parte.indexOf('-') + 2).trim();
      }
      if (parte.indexOf('Vigário') >= 0)
        obj.vigario = parte.substring(parte.indexOf('-') + 2).trim();
      if (parte.indexOf('Diácono') >= 0)
        obj.diacono = parte.substring(parte.indexOf('-') + 2).trim();

      x = x.substring(x.indexOf('</li>') + 4);
    }
    Future<String> a;
    return a;
  }
}
