// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectDetailViewModel on _ProjectDetailViewModelBase, Store {
  final _$itemsAtom = Atom(name: '_ProjectDetailViewModelBase.items');

  @override
  List<ProjectDetailModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<ProjectDetailModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$connectDataBaseAsyncAction =
      AsyncAction('_ProjectDetailViewModelBase.connectDataBase');

  @override
  Future<void> connectDataBase() {
    return _$connectDataBaseAsyncAction.run(() => super.connectDataBase());
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
