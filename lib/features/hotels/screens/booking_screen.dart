import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '/features/hotels/stores/booking_form_store.dart';
import '../../../main.dart';
import '../models/booking.dart';
import '../models/hotel.dart';
import '../stores/booking_store.dart';


class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key, required this.hotel});
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    final form = getIt<BookingFormStore>();
    final bookingStore = getIt<BookingStore>();
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Бронирование')),
      body: Observer(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Отель: ${hotel.name}', textAlign: TextAlign.center,style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  onChanged: form.setGuests,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.people),
                    labelText: 'Количество гостей',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () async {
                    final now = DateTime.now();
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: now,
                      lastDate: DateTime(now.year + 1),
                    );
                    if (picked != null) form.setDate(picked);
                  },
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Дата',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                      //contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    ),
                    child: Text(
                      form.date == null
                          ? "Выберите дату"
                          : "${form.date!.day}.${form.date!.month}.${form.date!.year}",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: form.canConfirm
                      ? () {
                    final booking = Booking(
                      hotelName: hotel.name,
                      city: hotel.city,
                      price: hotel.price,
                      guests: form.guests!,
                      date: form.date!,
                    );

                    bookingStore.addBooking(booking);

                    form.reset();
                    context.go('/history');
                  }
                      : null,
                  child: const Text("Подтвердить"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
