import 'package:hive/hive.dart';
import '../models/booking.dart';

class BookingStorage {
  final Box<Booking> box = Hive.box<Booking>("booking_box");

  Future<void> addBooking(Booking booking) async {
    await box.add(booking);
  }

  List<Booking> getAll() {
    return box.values.toList();
  }
}
