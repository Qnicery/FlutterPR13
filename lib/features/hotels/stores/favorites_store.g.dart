// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesStore on _FavoritesStore, Store {
  late final _$favoritesByUserIdAtom = Atom(
    name: '_FavoritesStore.favoritesByUserId',
    context: context,
  );

  @override
  ObservableMap<int, ObservableList<Hotel>> get favoritesByUserId {
    _$favoritesByUserIdAtom.reportRead();
    return super.favoritesByUserId;
  }

  @override
  set favoritesByUserId(ObservableMap<int, ObservableList<Hotel>> value) {
    _$favoritesByUserIdAtom.reportWrite(value, super.favoritesByUserId, () {
      super.favoritesByUserId = value;
    });
  }

  late final _$_FavoritesStoreActionController = ActionController(
    name: '_FavoritesStore',
    context: context,
  );

  @override
  void toggleFavorite(int userId, Hotel hotel) {
    final _$actionInfo = _$_FavoritesStoreActionController.startAction(
      name: '_FavoritesStore.toggleFavorite',
    );
    try {
      return super.toggleFavorite(userId, hotel);
    } finally {
      _$_FavoritesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoritesByUserId: ${favoritesByUserId}
    ''';
  }
}
