import 'package:mobx/mobx.dart';

part 'add_review_store.g.dart';

class AddReviewStore = _AddReviewStore with _$AddReviewStore;

abstract class _AddReviewStore with Store {
  @observable
  String text = '';

  @observable
  int rating = 5;

  @action
  void setText(String value) => text = value;

  @action
  void setRating(int value) => rating = value;

  @computed
  bool get canSubmit => text.trim().isNotEmpty;
}
