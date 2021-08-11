// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectDetailViewModel on _ProjectDetailViewModelBase, Store {
  final _$menuValueAtom = Atom(name: '_ProjectDetailViewModelBase.menuValue');

  @override
  String get menuValue {
    _$menuValueAtom.reportRead();
    return super.menuValue;
  }

  @override
  set menuValue(String value) {
    _$menuValueAtom.reportWrite(value, super.menuValue, () {
      super.menuValue = value;
    });
  }

  final _$_ProjectDetailViewModelBaseActionController =
      ActionController(name: '_ProjectDetailViewModelBase');

  @override
  void onChanged(Object value) {
    final _$actionInfo = _$_ProjectDetailViewModelBaseActionController
        .startAction(name: '_ProjectDetailViewModelBase.onChanged');
    try {
      return super.onChanged(value);
    } finally {
      _$_ProjectDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
menuValue: ${menuValue}
    ''';
  }
}
