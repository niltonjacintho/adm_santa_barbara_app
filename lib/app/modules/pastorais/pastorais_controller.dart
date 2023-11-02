import 'package:admFlutter/app/models/pastorais.model.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
import 'package:uuid/uuid.dart';

part 'pastorais_controller.g.dart';

class PastoraisController = _PastoraisControllerBase with _$PastoraisController;

abstract class _PastoraisControllerBase with Store {
  List<PastoraisModel> _listaPastorais = []; //new List<PastoraisModel>();

  @observable
  PastoraisModel pastoralAtiva = new PastoraisModel();

  @observable
  List<PastoraisModel> listaPastorais = []; // new List<PastoraisModel>();

  List<PastoraisModel> m = []; //new List<PastoraisModel>();

  @observable
  String filtro = '';

  var uuid = Uuid();

  @action
  Stream<fs.QuerySnapshot> getPastorais() {
    Stream<fs.QuerySnapshot> snap = fb
        .firestore()
        .collection('pastorais')
        //  .where('titulo', '>=', filtro)
        .orderBy('titulo')
        //    .where('ativo', '==', true)
        .onSnapshot;
    _listaPastorais = [];
   // new List<PastoraisModel>();
    snap.forEach((field) {
      field.docs.asMap().forEach((index, data) {
        PastoraisModel p = new PastoraisModel();
        p.ativo = true;
        p.codigo = data.get("codigo");
        p.id = data.id;

        //    p.comentarios = new List<Comentarios>();
        // data.get("comentarios");
        p.conteudo = data.get("conteudo");
        p.dtInclusao = data.get("dtInclusao");
        p.dtAlteracao = data.get("dtAlteracao");
        p.imagem = data.get("imagem");
        p.ordem = data.get("ordem");
        p.sigla = data.get("sigla");
        p.titulo = data.get("titulo");
        _listaPastorais.add(p);
      });
      listaPastorais = _listaPastorais;
    });
    return snap;
  }

  @action
  lista(String filtro) {
    listaPastorais = _listaPastorais
        .where(
            (p) => p.titulo.toLowerCase().contains(filtro.trim().toLowerCase()))
        .toList();
  }

  add() {
    pastoralAtiva = new PastoraisModel();
    pastoralAtiva.id = uuid.v4();
  }

  gravar() async {
    pastoralAtiva.dtInclusao = pastoralAtiva.dtInclusao == null
        ? DateTime.now()
        : pastoralAtiva.dtInclusao;
    fs.DocumentReference reference =
        fb.firestore().doc("pastorais/" + pastoralAtiva.id.trim());
    pastoralAtiva.imagem = '';
    pastoralAtiva.dtAlteracao = DateTime.now();
    pastoralAtiva.ativo = true;
    reference
        .set(pastoralAtiva.toJson())
        .then((result) => {})
        .catchError((err) => print('ERROR $err'));
    // });
  }

  apagar() async {
    if (pastoralAtiva.id != null && pastoralAtiva.id != '') {
      print('PASTORAL NA EXCLUSAO ${pastoralAtiva.id}');
      fs.DocumentReference reference =
          fb.firestore().doc("pastorais/" + pastoralAtiva.id.trim());
      reference
          .delete()
          .then((result) => {})
          .catchError((err) => print('ERROR $err'));
      // });
    }
  }
}
