import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../../main.dart';
import '../stores/auth_store.dart';
import '../stores/favorites_store.dart';
import '../widgets/hotel_list.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesStore = getIt<FavoritesStore>();
    final authStore = getIt<AuthStore>();
    final currentUserId = authStore.currentUser?.id;

    if (currentUserId == null) {
      return const Scaffold(
        body: Center(child: Text('Пользователь не авторизован')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
      ),
      body: Observer(
        builder: (_) {
          final favorites = favoritesStore.getFavorites(currentUserId);

          if (favorites.isEmpty) {
            return const Center(child: Text('Нет избранных отелей'));
          }

          return HotelList(
            hotels: favorites,
            onBook: (hotel) {
              context.push('/hotels/detail', extra: hotel);
            },
          );
        },
      ),
    );
  }
}
