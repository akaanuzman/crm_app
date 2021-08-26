// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  final _$itemAtom = Atom(name: '_LoginViewModelBase.item');

  @override
  List<String>? get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(List<String>? value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  final _$fetchItemsAsyncAction = AsyncAction('_LoginViewModelBase.fetchItems');

  @override
  Future<void> fetchItems(String email, String password) {
    return _$fetchItemsAsyncAction.run(() => super.fetchItems(email, password));
  }

  @override
  String toString() {
    return '''
item: ${item}
    ''';
  }
}
