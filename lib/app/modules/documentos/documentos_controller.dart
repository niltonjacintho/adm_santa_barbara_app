import 'package:admFlutter/app/models/documentsModel.dart';
import 'package:admFlutter/app/models/igreja.model.dart';
import 'package:admFlutter/app/shared/auth_service.dart';
import 'package:admFlutter/app/shared/util_service.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
import 'dart:html' as html;

part 'documentos_controller.g.dart';

class DocumentosController = _DocumentosControllerBase
    with _$DocumentosController;

abstract class _DocumentosControllerBase with Store {
  UtilService utilService = Modular.get();
  // fs.Firestore store = fb.firestore();

  @observable
  DocumentsModel documentoAtivo;

  @observable
  html.File imageFile;

  @observable
  List listaPastorais = [];

  @observable
  String filterPastorais = '';

  @observable
  String filterArtigos = '';

  @observable
  List questionsList = [];

  var uuid = Uuid();

  set setDocuments(DocumentsModel value) => documentoAtivo = value;
  DocumentsModel get getDocuments => documentoAtivo;

  // DocumentsRepository documentsRepository = new DocumentsRepository();
  // Stream<QuerySnapshot> getStreamList(Category categoria) {
  //   return documentsRepository.xGetStream();
  // }

  // Stream<QuerySnapshot> xGetStreamList(Category categoria) {
  //   return documentsRepository.xGetStream();
  // }

  @action
  void setDocumentoAtivo(Map<String, dynamic> doc) {
    print('DOC SET EM DOC $doc');
    documentoAtivo = new DocumentsModel(
        titulo: doc['titulo'] != null ? doc['titulo'] : '',
        id: doc['id'] != null ? doc['id'] : '',
        subtitulo: doc['subtitulo'] != null ? doc['subtitulo'] : '',
        conteudo: doc['conteudo'] != null ? doc['conteudo'] : '',
        likes: doc['likes'] != null ? doc['likes'] : 0,
        visualizacoes: doc['visualizacoes'] != null ? doc['visualizacoes'] : 0,
        //  autor: doc['autor'] != null ? doc['autor'] : '',
        imagem: doc['imagem'] != null ? doc['imagem'] : '',
        ativo: true, //doc['ativo'] != null ? doc['visualizacoes'] : true,
        autor: AuthService.shared.activeUser.email != ''
            ? AuthService.shared.activeUser.email
            : '',
        dtInclusao: DateTime.now(),
        grupo: doc['grupo'] != null ? doc['grupo'] : " ");
  }

  gravar() async {
    if (documentoAtivo.id == null || documentoAtivo.id == '') {
      documentoAtivo.id = uuid.v4();
    }
    fs.DocumentReference reference =
        fb.firestore().doc("artigos/" + documentoAtivo.id);
    documentoAtivo.imagem = await uploadImage(imageFile);
    documentoAtivo.dtInclusao = documentoAtivo.dtInclusao == null
        ? DateTime.now()
        : documentoAtivo.dtInclusao;
    documentoAtivo.dtLimiteExibicao = DateTime.now();
    documentoAtivo.visualizacoes = documentoAtivo.visualizacoes == null
        ? 0
        : documentoAtivo.visualizacoes + 1;
    documentoAtivo.likes =
        documentoAtivo.likes == null ? 0 : documentoAtivo.likes + 1;
    reference
        .set(documentoAtivo.toMap())
        .then((result) => {})
        .catchError((err) => print('ERROR $err'));
    // });
  }

  gravarParoquias(Igreja paroquia) async {
    print('VAI GRAVAR ${paroquia.toJson()}');
    fs.DocumentReference reference =
        fb.firestore().doc("paroquias/" + paroquia.nome.trim().toLowerCase());
    print(reference);
    reference
        .set(paroquia.toJson())
        .then((result) => {})
        .catchError((err) => print('ERROR $err'));
  }

  apagar() async {
    if (documentoAtivo.id != null && documentoAtivo.id != '') {
      fs.DocumentReference reference =
          fb.firestore().doc("artigos/" + documentoAtivo.id);
      reference
          .delete()
          .then((result) => {})
          .catchError((err) => print('ERROR $err'));
      // });
    }
  }

  Future<String> uploadImage(html.File imagem) async {
    try {
      fb.StorageReference storageRef =
          fb.storage().ref('aviso/${documentoAtivo.id}');
      print('passou no fb $storageRef');
      fb.UploadTaskSnapshot uploadTask = await storageRef.put(imagem).future;
      Uri imageUri = await uploadTask.ref.getDownloadURL();
      print('URL FOTO $imageUri');
      return imageUri.toString();
    } catch (e) {
      print('ERRO NO STORAGE $e');
    }
    return '';
// Create a reference to 'mountains.jpg'
  }

  Stream<fs.QuerySnapshot> getStreamAvisos() {
    Stream<fs.QuerySnapshot> firedados = fb
        .firestore()
        .collection('artigos')
        .where('ativo', '==', true)
        .onSnapshot;

    return firedados;

    // return snap;
  }

  // Stream<QuerySnapshot> getStreamByGroup(int group) {
  //   var query = fb.firestore().collection('artigos');
  //   if (filterArtigos != '') {
  //     query = query.where('titulo', '>=', filterPastorais);
  //   }
  //   return query
  //       .where('grupo', '>=', group.toString())
  //       .where('ativo', '>=', true)
  //       .onSnapshot(value)=>{return value};
  //   // return snap;
  // }

  // Future<QuerySnapshot> getDocumentsByGroup(int group) {
  //   Future<QuerySnapshot> doc = Firestore.instance
  //       .collection('artigos')
  //       .where('grupo', '>=', group.toString())
  //       .where('ativo', '>=', true)
  //       .getDocuments();

  //   doc.then((d) => {
  //         print(d),
  //         documents = new DocumentsModel(),
  //         documents.id = d.documents[0].data['id'],
  //         documents.titulo = d.documents[0].data['titulo'],
  //         documents.subtitulo = d.documents[0].data['subtitulo'],
  //         documents.conteudo = d.documents[0].data['conteudo'],
  //         documents.imagem = d.documents[0].data['imagem'],
  //       });
  //   return doc;
  // }

  // @action
  // Future<List> getPastorais() async {
  //   var snap = Firestore.instance
  //       .collection('pastorais')
  //       .orderBy("titulo")
  //       .snapshots();
  //   listaPastorais = [];
  //   snap.forEach((field) {
  //     field.documents.asMap().forEach((index, data) {
  //       // print(data);
  //       if (dadoValidoPesquisa(data['titulo']) |
  //           dadoValidoPesquisa(data['sigla'])) {
  //         listaPastorais.add(data);
  //       }
  //     });
  //   });
  //   // print(listaPastorais);
  //   return listaPastorais;
  // }

  // bool dadoValidoPesquisa(value) {
  //   return (value
  //               .toString()
  //               .toLowerCase()
  //               .indexOf(filterPastorais.toLowerCase()) !=
  //           -1) |
  //       (filterPastorais == '');
  // }

  // //@action
  // getQuestions() async {
  //   print('GETTING QUESTIONS');
  //   Future<QuerySnapshot> snap = Firestore.instance
  //       .collection('artigos')
  //       //   .where('grupo', '>=', '700')
  //       //   .where('ativo', '>=', true)
  //       .getDocuments();
  //   //   .then((onValue) => print('ONVALUE $onValue'));
  //   int i = 0;
  //   try {
  //     await snap.then(
  //       (doc) => {
  //         questionsList = [],
  //         for (DocumentSnapshot item in doc.documents)
  //           {
  //             if (item.data['subtitulo'] != null)
  //               {
  //                 questionsList.add(
  //                   {
  //                     '\'name\'': '\'${item.data['titulo']}\'',
  //                     '\'group\'': '\'${item.data['subtitulo']}\''
  //                   },
  //                 ),
  //                 print(i),
  //                 i++,
  //               }
  //           },
  //       },
  //     );
  //   } catch (e) {
  //     print('error $e');
  //   }
  // }
}
