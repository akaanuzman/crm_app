// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acces_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccessViewModel on _AccessViewModelBase, Store {
  final _$isSwitchAtom = Atom(name: '_AccessViewModelBase.isSwitch');

  @override
  bool get isSwitch {
    _$isSwitchAtom.reportRead();
    return super.isSwitch;
  }

  @override
  set isSwitch(bool value) {
    _$isSwitchAtom.reportWrite(value, super.isSwitch, () {
      super.isSwitch = value;
    });
  }

  final _$_AccessViewModelBaseActionController =
      ActionController(name: '_AccessViewModelBase');

  @override
  void changeSwitch() {
    final _$actionInfo = _$_AccessViewModelBaseActionController.startAction(
        name: '_AccessViewModelBase.changeSwitch');
    try {
      return super.changeSwitch();
    } finally {
      _$_AccessViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSwitch: ${isSwitch}
    ''';
  }
}
