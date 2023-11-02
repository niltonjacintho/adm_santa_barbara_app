// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documentos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DocumentosController on _DocumentosControllerBase, Store {
  final _$documentoAtivoAtom =
      Atom(name: '_DocumentosControllerBase.documentoAtivo');

  @override
  DocumentsModel get documentoAtivo {
    _$documentoAtivoAtom.reportRead();
    return super.documentoAtivo;
  }

  @override
  set documentoAtivo(DocumentsModel value) {
    _$documentoAtivoAtom.reportWrite(value, super.documentoAtivo, () {
      super.documentoAtivo = value;
    });
  }

  final _$imageFileAtom = Atom(name: '_DocumentosControllerBase.imageFile');

  @override
  html.File get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(html.File value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  final _$listaPastoraisAtom =
      Atom(name: '_DocumentosControllerBase.listaPastorais');

  @override
  List<dynamic> get listaPastorais {
    _$listaPastoraisAtom.reportRead();
    return super.listaPastorais;
  }

  @override
  set listaPastorais(List<dynamic> value) {
    _$listaPastoraisAtom.reportWrite(value, super.listaPastorais, () {
      super.listaPastorais = value;
    });
  }

  final _$filterPastoraisAtom =
      Atom(name: '_DocumentosControllerBase.filterPastorais');

  @override
  String get filterPastorais {
    _$filterPastoraisAtom.reportRead();
    return super.filterPastorais;
  }

  @override
  set filterPastorais(String value) {
    _$filterPastoraisAtom.reportWrite(value, super.filterPastorais, () {
      super.filterPastorais = value;
    });
  }

  final _$filterArtigosAtom =
      Atom(name: '_DocumentosControllerBase.filterArtigos');

  @override
  String get filterArtigos {
    _$filterArtigosAtom.reportRead();
    return super.filterArtigos;
  }

  @override
  set filterArtigos(String value) {
    _$filterArtigosAtom.reportWrite(value, super.filterArtigos, () {
      super.filterArtigos = value;
    });
  }

  final _$questionsListAtom =
      Atom(name: '_DocumentosControllerBase.questionsList');

  @override
  List<dynamic> get questionsList {
    _$questionsListAtom.reportRead();
    return super.questionsList;
  }

  @override
  set questionsList(List<dynamic> value) {
    _$questionsListAtom.reportWrite(value, super.questionsList, () {
      super.questionsList = value;
    });
  }

  final _$_DocumentosControllerBaseActionController =
      ActionController(name: '_DocumentosControllerBase');

  @override
  void setDocumentoAtivo(Map<String, dynamic> doc) {
    final _$actionInfo = _$_DocumentosControllerBaseActionController
        .startAction(name: '_DocumentosControllerBase.setDocumentoAtivo');
    try {
      return super.setDocumentoAtivo(doc);
    } finally {
      _$_DocumentosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
documentoAtivo: ${documentoAtivo},
imageFile: ${imageFile},
listaPastorais: ${listaPastorais},
filterPastorais: ${filterPastorais},
filterArtigos: ${filterArtigos},
questionsList: ${questionsList}
    ''';
  }
}
