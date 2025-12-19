import 'package:mobx/mobx.dart';

part 'booking_form_store.g.dart';

class BookingFormStore  = _BookingFormStore  with _$BookingFormStore;

abstract class _BookingFormStore  with Store {
  @observable
  int? guests;

  @observable
  DateTime? date;

  @computed
  bool get canConfirm => guests != null && guests! > 0 && date != null;

  @action
  void setGuests(String text) {
    guests = int.tryParse(text);
  }

  @action
  void setDate(DateTime value) {
    date = value;
  }
  @action
  void reset() {
    guests = null;
    date = null;
  }
}
