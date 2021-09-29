// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterViewModel on _RegisterViewModelBase, Store {
  final _$isOpenAtom = Atom(name: '_RegisterViewModelBase.isOpen');

  @override
  bool get isOpen {
    _$isOpenAtom.reportRead();
    return super.isOpen;
  }

  @override
  set isOpen(bool value) {
    _$isOpenAtom.reportWrite(value, super.isOpen, () {
      super.isOpen = value;
    });
  }

  final _$isCloseAtom = Atom(name: '_RegisterViewModelBase.isClose');

  @override
  bool get isClose {
    _$isCloseAtom.reportRead();
    return super.isClose;
  }

  @override
  set isClose(bool value) {
    _$isCloseAtom.reportWrite(value, super.isClose, () {
      super.isClose = value;
    });
  }

  final _$isButtonCloseAtom =
      Atom(name: '_RegisterViewModelBase.isButtonClose');

  @override
  bool get isButtonClose {
    _$isButtonCloseAtom.reportRead();
    return super.isButtonClose;
  }

  @override
  set isButtonClose(bool value) {
    _$isButtonCloseAtom.reportWrite(value, super.isButtonClose, () {
      super.isButtonClose = value;
    });
  }

  final _$_RegisterViewModelBaseActionController =
      ActionController(name: '_RegisterViewModelBase');

  @override
  void openToClose() {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.openToClose');
    try {
      return super.openToClose();
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void closeToOpen() {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.closeToOpen');
    try {
      return super.closeToOpen();
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void buttonCloseOrOpen() {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.buttonCloseOrOpen');
    try {
      return super.buttonCloseOrOpen();
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isOpen: ${isOpen},
isClose: ${isClose},
isButtonClose: ${isButtonClose}
    ''';
  }
}
