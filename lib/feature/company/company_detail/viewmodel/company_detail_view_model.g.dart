// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CompanyDetailViewModel on _CompanyDetailViewModelBase, Store {
  final _$itemsAtom = Atom(name: '_CompanyDetailViewModelBase.items');

  @override
  CompanyDetailModel get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(CompanyDetailModel value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$fetchItemsAsyncAction =
      AsyncAction('_CompanyDetailViewModelBase.fetchItems');

  @override
  Future<void> fetchItems(String token, String id) {
    return _$fetchItemsAsyncAction.run(() => super.fetchItems(token, id));
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
