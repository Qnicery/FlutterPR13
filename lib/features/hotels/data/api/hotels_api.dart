import 'package:dio/dio.dart';

import '../../models/hotel.dart';
import '../../models/review.dart';


class HotelsApi {
  final Dio dio;

  HotelsApi()
      : dio = Dio(BaseOptions(
    baseUrl: 'http://10.0.2.2:8081', // Android эмулятор
    headers: {'Content-Type': 'application/json'},
  ));

  // -------------------- HOTELS --------------------
  Future<List<Hotel>> getHotels() async {
    final response = await dio.get('/hotels');
    return (response.data as List)
        .map((json) => Hotel(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
    ))
        .toList();
  }

  Future<Hotel> addHotel(Hotel hotel) async {
    final response = await dio.post('/hotels', data: {
      "name": hotel.name,
      "city": hotel.city,
      "imageUrl": hotel.imageUrl,
      "price": hotel.price,
      "description": hotel.description
    });
    final json = response.data;
    return Hotel(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
    );
  }

  Future<List<Hotel>> searchHotels(String query) async {
    final response = await dio.get('/hotels/search/$query');
    return (response.data as List)
        .map((json) => Hotel(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
    ))
        .toList();
  }

  // -------------------- REVIEWS --------------------
  Future<List<Review>> getReviewsByHotelId(String hotelId) async {
    final response = await dio.get('/reviews/$hotelId');
    return (response.data as List)
        .map((json) => Review(
      userName: json['userName'],
      rating: json['rating'],
      text: json['text'],
      hotelId: json['hotelId'],
    ))
        .toList();
  }

  Future<Review> addReview(Review review) async {
    final response = await dio.post('/reviews', data: {
      "userName": review.userName,
      "rating": review.rating,
      "text": review.text,
      "hotelId": review.hotelId
    });
    final json = response.data;
    return Review(
      userName: json['userName'],
      rating: json['rating'],
      text: json['text'],
      hotelId: json['hotelId'],
    );
  }
}
