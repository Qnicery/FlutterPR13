import 'package:mobx/mobx.dart';
import '../models/hotel.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStore with _$FavoritesStore;

abstract class _FavoritesStore with Store {
  @observable
  ObservableMap<int, ObservableList<Hotel>> favoritesByUserId = ObservableMap();

  @action
  void toggleFavorite(int userId, Hotel hotel) {
    final list = favoritesByUserId[userId] ?? ObservableList<Hotel>();
    if (list.contains(hotel)) {
      list.remove(hotel);
    } else {
      list.add(hotel);
    }
    favoritesByUserId[userId] = list;
  }

  List<Hotel> getFavorites(int userId) {
    return favoritesByUserId[userId]?.toList() ?? [];
  }

  bool isFavorite(int userId, Hotel hotel) {
    return favoritesByUserId[userId]?.contains(hotel) ?? false;
  }
}

