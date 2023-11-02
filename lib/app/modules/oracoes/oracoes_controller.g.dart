// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oracoes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OracoesController on _OracoesControllerBase, Store {
  final _$valueAtom = Atom(name: '_OracoesControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$oracoesModelAtom = Atom(name: '_OracoesControllerBase.oracoesModel');

  @override
  OracoesModel get oracoesModel {
    _$oracoesModelAtom.reportRead();
    return super.oracoesModel;
  }

  @override
  set oracoesModel(OracoesModel value) {
    _$oracoesModelAtom.reportWrite(value, super.oracoesModel, () {
      super.oracoesModel = value;
    });
  }

  final _$_OracoesControllerBaseActionController =
      ActionController(name: '_OracoesControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_OracoesControllerBaseActionController.startAction(
        name: '_OracoesControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_OracoesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
oracoesModel: ${oracoesModel}
    ''';
  }
}
