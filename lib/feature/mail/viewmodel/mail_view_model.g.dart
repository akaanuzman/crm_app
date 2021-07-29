// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MailViewModel on _MailViewModelBase, Store {
  final _$isContainerHeightChangeAtom =
      Atom(name: '_MailViewModelBase.isContainerHeightChange');

  @override
  bool get isContainerHeightChange {
    _$isContainerHeightChangeAtom.reportRead();
    return super.isContainerHeightChange;
  }

  @override
  set isContainerHeightChange(bool value) {
    _$isContainerHeightChangeAtom
        .reportWrite(value, super.isContainerHeightChange, () {
      super.isContainerHeightChange = value;
    });
  }

  final _$_MailViewModelBaseActionController =
      ActionController(name: '_MailViewModelBase');

  @override
  void changeContainerHeight() {
    final _$actionInfo = _$_MailViewModelBaseActionController.startAction(
        name: '_MailViewModelBase.changeContainerHeight');
    try {
      return super.changeContainerHeight();
    } finally {
      _$_MailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isContainerHeightChange: ${isContainerHeightChange}
    ''';
  }
}
