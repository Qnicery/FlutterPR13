import 'package:mobx/mobx.dart';
import '../data/booking_storage.dart';
import '../models/booking.dart';

part 'booking_store.g.dart';

class BookingStore = _BookingStore with _$BookingStore;

abstract class _BookingStore with Store {
  final BookingStorage storage = BookingStorage();

  @observable
  ObservableList<Booking> history = ObservableList<Booking>();

  @action
  Future<void> loadBookings() async {
    final bookings = storage.getAll();
    history = ObservableList.of(bookings);
  }

  @action
  Future<void> addBooking(Booking booking) async {
    await storage.addBooking(booking);
    history.add(booking);
  }
}
