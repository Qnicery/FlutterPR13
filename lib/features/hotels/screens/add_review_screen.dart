import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/features/hotels/stores/auth_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/add_review_store.dart';
import '../stores/review_store.dart';
import '../models/review.dart';
import '../models/hotel.dart';
import '../../../main.dart';


class AddReviewScreen extends StatelessWidget {
  final Hotel hotel;

  const AddReviewScreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final reviewStore = getIt<ReviewStore>();
    final formStore = getIt<AddReviewStore>();
    final user = getIt<AuthStore>().currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Оставить отзыв')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Рейтинг', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            Observer(
              builder: (_) => Row(
                children: List.generate(
                  5,
                      (index) => IconButton(
                    icon: Icon(
                      index < formStore.rating
                          ? Icons.star
                          : Icons.star_border,
                      color: Colors.amber,
                    ),
                    onPressed: () => formStore.setRating(index + 1),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Text('Комментарий', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            Expanded(
              child: Observer(
                builder: (_) => TextField(
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Введите текст отзыва',
                  ),
                  onChanged: formStore.setText,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Observer(
              builder: (_) => ElevatedButton(
                onPressed: formStore.canSubmit
                    ? () {
                  reviewStore.addReview(
                    Review(
                      userName: user?.name ?? '...',
                      rating: formStore.rating,
                      text: formStore.text,
                      hotelId: hotel.id,
                    ),
                  );
                  context.pop();
                }
                    : null,
                child: const Text('Отправить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

