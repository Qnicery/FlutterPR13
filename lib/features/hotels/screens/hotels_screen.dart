import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../../main.dart';
import '../stores/hotels_store.dart';
import '../widgets/city_button.dart';
import '../widgets/hotel_list.dart';


class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hotelsStore = getIt<HotelsStore>();


    return Scaffold(
      appBar: AppBar(
        title: const Text('Отели'),
        centerTitle: true,
      ),
      body: Observer(builder: (_) {
        return Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                children: [
                  CityButton(
                    text: "Все города",
                    selected: hotelsStore.selectedCity == null,
                    onTap: () => hotelsStore.selectCity(null),
                  ),
                  for (final city in hotelsStore.cities)
                    CityButton(
                      text: city,
                      selected: hotelsStore.selectedCity == city,
                      onTap: () => hotelsStore.selectCity(city),
                    )
                ],
              ),
            ),
            Expanded(
              child: HotelList(
                hotels: hotelsStore.filteredHotels,
                onBook: (hotel) {
                  context.push('/hotels/detail', extra: hotel);
                },
              ),
            )
          ],
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (i) {
          switch (i) {
            case 1:
              context.go('/history');
              break;
            case 2:
              context.go('/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Главная"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "История"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
        ],
      ),
    );
  }
}

