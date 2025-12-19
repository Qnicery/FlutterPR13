// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FaqStore on _FaqStore, Store {
  late final _$itemsAtom = Atom(name: '_FaqStore.items', context: context);

  @override
  ObservableList<FaqItem> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<FaqItem> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$expandedIndexesAtom = Atom(
    name: '_FaqStore.expandedIndexes',
    context: context,
  );

  @override
  ObservableSet<int> get expandedIndexes {
    _$expandedIndexesAtom.reportRead();
    return super.expandedIndexes;
  }

  @override
  set expandedIndexes(ObservableSet<int> value) {
    _$expandedIndexesAtom.reportWrite(value, super.expandedIndexes, () {
      super.expandedIndexes = value;
    });
  }

  late final _$_FaqStoreActionController = ActionController(
    name: '_FaqStore',
    context: context,
  );

  @override
  void toggleExpand(int index) {
    final _$actionInfo = _$_FaqStoreActionController.startAction(
      name: '_FaqStore.toggleExpand',
    );
    try {
      return super.toggleExpand(index);
    } finally {
      _$_FaqStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
expandedIndexes: ${expandedIndexes}
    ''';
  }
}
