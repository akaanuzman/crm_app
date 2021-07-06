// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectModel on _ProjectModelBase, Store {
  final _$isSwitchListTileOpenAtom =
      Atom(name: '_ProjectModelBase.isSwitchListTileOpen');

  @override
  bool get isSwitchListTileOpen {
    _$isSwitchListTileOpenAtom.reportRead();
    return super.isSwitchListTileOpen;
  }

  @override
  set isSwitchListTileOpen(bool value) {
    _$isSwitchListTileOpenAtom.reportWrite(value, super.isSwitchListTileOpen,
        () {
      super.isSwitchListTileOpen = value;
    });
  }

  final _$_ProjectModelBaseActionController =
      ActionController(name: '_ProjectModelBase');

  @override
  void openCloseSwitchListTile(bool value) {
    final _$actionInfo = _$_ProjectModelBaseActionController.startAction(
        name: '_ProjectModelBase.openCloseSwitchListTile');
    try {
      return super.openCloseSwitchListTile(value);
    } finally {
      _$_ProjectModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSwitchListTileOpen: ${isSwitchListTileOpen}
    ''';
  }
}
