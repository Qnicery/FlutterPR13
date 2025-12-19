// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReviewStore on _ReviewStore, Store {
  late final _$reviewsAtom = Atom(
    name: '_ReviewStore.reviews',
    context: context,
  );

  @override
  ObservableList<Review> get reviews {
    _$reviewsAtom.reportRead();
    return super.reviews;
  }

  @override
  set reviews(ObservableList<Review> value) {
    _$reviewsAtom.reportWrite(value, super.reviews, () {
      super.reviews = value;
    });
  }

  late final _$loadReviewsAsyncAction = AsyncAction(
    '_ReviewStore.loadReviews',
    context: context,
  );

  @override
  Future<void> loadReviews(String hotelId) {
    return _$loadReviewsAsyncAction.run(() => super.loadReviews(hotelId));
  }

  late final _$addReviewAsyncAction = AsyncAction(
    '_ReviewStore.addReview',
    context: context,
  );

  @override
  Future<void> addReview(Review review) {
    return _$addReviewAsyncAction.run(() => super.addReview(review));
  }

  @override
  String toString() {
    return '''
reviews: ${reviews}
    ''';
  }
}
