import 'package:mobx/mobx.dart';
import '../models/review.dart';
import '../data/api/hotels_api.dart';

part 'review_store.g.dart';

class ReviewStore = _ReviewStore with _$ReviewStore;

abstract class _ReviewStore with Store {
  final HotelsApi _api = HotelsApi();


  @observable
  ObservableList<Review> reviews = ObservableList<Review>();

  List<Review> reviewsForHotel(String hotelId) =>
      reviews.where((r) => r.hotelId == hotelId).toList();

  @action
  Future<void> loadReviews(String hotelId) async {
    final list = await _api.getReviewsByHotelId(hotelId);
    reviews = ObservableList.of(list);
  }

  @action
  Future<void> addReview(Review review) async {
    final newReview = await _api.addReview(review);
    reviews.add(newReview);
  }
}
