import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '/features/hotels/screens/add_review_screen.dart';
import '/features/hotels/screens/faq_screen.dart';
import '/features/hotels/screens/favorite_screen.dart';
import '/features/hotels/screens/register_screen.dart';
import '/features/hotels/stores/add_review_store.dart';
import '/features/hotels/stores/auth_store.dart';
import '/features/hotels/stores/booking_form_store.dart';
import '/features/hotels/stores/favorites_store.dart';
import '/features/hotels/stores/review_store.dart';
import '/features/hotels/screens/hotels_screen.dart';
import 'features/hotels/models/booking.dart';
import 'features/hotels/models/hotel.dart';
import 'features/hotels/screens/booking_screen.dart';
import 'features/hotels/screens/history_screen.dart';
import 'features/hotels/screens/hotel_detail_screen.dart';
import 'features/hotels/screens/login_screen.dart';
import 'features/hotels/screens/profile_screen.dart';
import 'features/hotels/screens/settings_screen.dart';
import 'features/hotels/stores/booking_store.dart';
import 'features/hotels/stores/faq_store.dart';
import 'features/hotels/stores/hotels_store.dart';



final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(BookingAdapter());
  await Hive.openBox<Booking>('booking_box');

  getIt.registerLazySingleton(() => AuthStore());
  getIt.registerLazySingleton(() => BookingStore());
  getIt.registerLazySingleton(() => HotelsStore());
  getIt.registerLazySingleton(() => BookingFormStore());
  getIt.registerLazySingleton(() => ReviewStore());
  getIt.registerLazySingleton(() => AddReviewStore());
  getIt.registerLazySingleton(() => FavoritesStore());
  getIt.registerLazySingleton(() => FaqStore());
  await getIt<BookingStore>().loadBookings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = getIt<AuthStore>();
    final GoRouter _router = GoRouter(
      initialLocation: '/hotels',
      redirect: (context, state) {
        final loggedIn = auth.isLoggedIn;
        final goingToLogin = state.matchedLocation == '/login';
        final goingToRegister = state.matchedLocation == '/register';

        if (!loggedIn && !goingToLogin && !goingToRegister) {
          return '/login';
        }

        return null;
      },
      routes: [
        GoRoute(
          name: 'login',
          path: '/login',
          builder: (_, __) => const LoginScreen(),
        ),
        GoRoute(
          name: 'register',
          path: '/register',
          builder: (_, __) => const RegisterScreen(),
        ),
        GoRoute(
          name: 'hotels',
          path: '/hotels',
          builder: (context, state) => const HotelsScreen(),
          routes: [
            GoRoute(
              name: 'hotelDetail',
              path: 'detail',
              builder: (context, state) {
                final hotel = state.extra as Hotel;
                return HotelDetailScreen(hotel: hotel);
              },
              routes: [
                GoRoute(
                  name: 'booking',
                  path: 'booking',
                  builder: (context, state) {
                    final hotel = state.extra as Hotel;
                    return BookingScreen(hotel: hotel);
                  },
                ),
                GoRoute(
                  name: 'review',
                  path: 'review',
                  builder: (context, state) {
                    final hotel = state.extra as Hotel;
                    return AddReviewScreen(hotel: hotel);
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          name: 'history',
          path: '/history',
          builder: (context, state)=> const HistoryScreen(),
        ),
        GoRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
          routes: [
            GoRoute(
              name: 'settings',
              path: 'settings',
              builder: (context, state) => const SettingsScreen(),
              routes: [
                GoRoute(
                  name: 'faq',
                  path: 'faq',
                  builder: (context, state) => const FaqScreen(),
                )
              ]
            ),
          ],
        ),
        GoRoute(
          name: 'favorites',
          path: '/favorites',
          builder: (context, state) => const FavoritesScreen(),
        ),
      ],
    );
    return MaterialApp.router(
        title: 'Бронирование отелей',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: _router,
      );
  }
}

