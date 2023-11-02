// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pastoraisedit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PastoraiseditController on _PastoraiseditControllerBase, Store {
  final _$valueAtom = Atom(name: '_PastoraiseditControllerBase.value');

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

  final _$_PastoraiseditControllerBaseActionController =
      ActionController(name: '_PastoraiseditControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_PastoraiseditControllerBaseActionController
        .startAction(name: '_PastoraiseditControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_PastoraiseditControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
