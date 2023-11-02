// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pastorais_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PastoraisController on _PastoraisControllerBase, Store {
  final _$pastoralAtivaAtom =
      Atom(name: '_PastoraisControllerBase.pastoralAtiva');

  @override
  PastoraisModel get pastoralAtiva {
    _$pastoralAtivaAtom.reportRead();
    return super.pastoralAtiva;
  }

  @override
  set pastoralAtiva(PastoraisModel value) {
    _$pastoralAtivaAtom.reportWrite(value, super.pastoralAtiva, () {
      super.pastoralAtiva = value;
    });
  }

  final _$listaPastoraisAtom =
      Atom(name: '_PastoraisControllerBase.listaPastorais');

  @override
  List<PastoraisModel> get listaPastorais {
    _$listaPastoraisAtom.reportRead();
    return super.listaPastorais;
  }

  @override
  set listaPastorais(List<PastoraisModel> value) {
    _$listaPastoraisAtom.reportWrite(value, super.listaPastorais, () {
      super.listaPastorais = value;
    });
  }

  final _$filtroAtom = Atom(name: '_PastoraisControllerBase.filtro');

  @override
  String get filtro {
    _$filtroAtom.reportRead();
    return super.filtro;
  }

  @override
  set filtro(String value) {
    _$filtroAtom.reportWrite(value, super.filtro, () {
      super.filtro = value;
    });
  }

  final _$_PastoraisControllerBaseActionController =
      ActionController(name: '_PastoraisControllerBase');

  @override
  Stream<fs.QuerySnapshot> getPastorais() {
    final _$actionInfo = _$_PastoraisControllerBaseActionController.startAction(
        name: '_PastoraisControllerBase.getPastorais');
    try {
      return super.getPastorais();
    } finally {
      _$_PastoraisControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic lista(String filtro) {
    final _$actionInfo = _$_PastoraisControllerBaseActionController.startAction(
        name: '_PastoraisControllerBase.lista');
    try {
      return super.lista(filtro);
    } finally {
      _$_PastoraisControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pastoralAtiva: ${pastoralAtiva},
listaPastorais: ${listaPastorais},
filtro: ${filtro}
    ''';
  }
}
