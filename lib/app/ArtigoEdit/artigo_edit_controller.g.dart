// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artigo_edit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArtigoEditController on _ArtigoEditControllerBase, Store {
  final _$valueAtom = Atom(name: '_ArtigoEditControllerBase.value');

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

  final _$_ArtigoEditControllerBaseActionController =
      ActionController(name: '_ArtigoEditControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ArtigoEditControllerBaseActionController
        .startAction(name: '_ArtigoEditControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ArtigoEditControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
