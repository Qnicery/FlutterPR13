import 'package:hive/hive.dart';

part 'booking.g.dart';

@HiveType(typeId: 1)
class Booking extends HiveObject {
  @HiveField(0)
  final String hotelName;

  @HiveField(1)
  final String city;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final int guests;

  @HiveField(4)
  final DateTime date;

  Booking({
    required this.hotelName,
    required this.city,
    required this.price,
    required this.guests,
    required this.date,
  });
}
