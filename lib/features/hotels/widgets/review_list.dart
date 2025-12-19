import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '/features/hotels/widgets/review_card.dart';
import '../../../main.dart';
import '../models/hotel.dart';
import '../stores/review_store.dart';

class ReviewList extends StatelessWidget {
  final Hotel hotel;

  const ReviewList({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final store = getIt<ReviewStore>();

    return Observer(
      builder: (_) {
        final items = store.reviewsForHotel(hotel.id);

        if (items.isEmpty) {
          return const Text("Пока нет отзывов");
        }

        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, index) {
            return ReviewCard(review: items[index]);
          },
        );
      },
    );
  }
}
