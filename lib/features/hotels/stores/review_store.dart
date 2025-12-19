import 'package:mobx/mobx.dart';
import '../models/review.dart';


part 'review_store.g.dart';


class ReviewStore = _ReviewStore with _$ReviewStore;

abstract class _ReviewStore with Store {
  @observable
  ObservableList<Review> reviews = ObservableList.of([
    Review(userName: "userName", rating: 3,
        text: "Очень большой отзыв Очень большой отзыв Очень большой отзыв Очень большой отзыв Очень большой отзыв Очень большой отзыв Очень большой отзыв Очень большой отзыв",
        hotelId: "1"),
    Review(userName: "userName", rating: 2, text: "text", hotelId: "1"),
    Review(userName: "userName", rating: 4, text: "Очень большой отзыв Очень большой отзыв Очень большой отзыв Очень большой отзывОчень большой отзыв Очень большой отзыв Очень большой отзыв Очень большой отзыв", hotelId: "1")
  ]);

  List<Review> reviewsForHotel(String hotelId) =>
      reviews.where((r) => r.hotelId == hotelId).toList();

  @action
  void addReview(Review review) {
    reviews.add(review);
  }
}


