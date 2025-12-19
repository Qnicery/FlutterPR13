import 'package:mobx/mobx.dart';

import '../models/faq_item.dart';

part 'faq_store.g.dart';

class FaqStore = _FaqStore with _$FaqStore;

abstract class _FaqStore with Store {
  @observable
  ObservableList<FaqItem> items = ObservableList.of([
    FaqItem(
      question: "Как оформить бронирование?",
      answer: "Выберите отель, нажмите 'Забронировать' и заполните данные.",
    ),
    FaqItem(
      question: "Как отменить бронь?",
      answer: "Откройте экран истории и выберите нужную бронь.",
    ),
    FaqItem(
      question: "Нужна ли регистрация?",
      answer: "Да, чтобы сохранять историю и избранное.",
    ),
    FaqItem(
      question: "Можно ли удалить аккаунт?",
      answer: "Нет, в данный момент такая функция отсутствует.",
    ),
  ]);

  @observable
  ObservableSet<int> expandedIndexes = ObservableSet();

  @action
  void toggleExpand(int index) {
    if (expandedIndexes.contains(index)) {
      expandedIndexes.remove(index);
    } else {
      expandedIndexes.add(index);
    }
  }

  bool isExpanded(int index) => expandedIndexes.contains(index);
}
