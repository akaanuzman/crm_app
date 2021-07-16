// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectViewModel on _ProjectViewModelBase, Store {
  final _$itemsAtom = Atom(name: '_ProjectViewModelBase.items');

  @override
  List<ProjectModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<ProjectModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$connectDataBaseAsyncAction =
      AsyncAction('_ProjectViewModelBase.connectDataBase');

  @override
  Future<void> connectDataBase() {
    return _$connectDataBaseAsyncAction.run(() => super.connectDataBase());
  }

  final _$_ProjectViewModelBaseActionController =
      ActionController(name: '_ProjectViewModelBase');

  @override
  void deleteItem(int index) {
    final _$actionInfo = _$_ProjectViewModelBaseActionController.startAction(
        name: '_ProjectViewModelBase.deleteItem');
    try {
      return super.deleteItem(index);
    } finally {
      _$_ProjectViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
