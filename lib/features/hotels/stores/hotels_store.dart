import 'package:mobx/mobx.dart';
import '../models/hotel.dart';
import '../data/api/hotels_api.dart';

part 'hotels_store.g.dart';

class HotelsStore = _HotelsStore with _$HotelsStore;

abstract class _HotelsStore with Store {
  final HotelsApi _api = HotelsApi();
  _HotelsStore() {
    loadHotels();
  }
  @observable
  ObservableList<Hotel> hotels = ObservableList<Hotel>();

  @observable
  String? selectedCity;

  @computed
  List<Hotel> get filteredHotels {
    if (selectedCity == null) return hotels.toList();
    return hotels.where((h) => h.city == selectedCity).toList();
  }

  @computed
  List<String> get cities => hotels.map((e) => e.city).toSet().toList();

  @action
  void selectCity(String? city) {
    selectedCity = city;
  }

  @action
  Future<void> loadHotels() async {
    final list = await _api.getHotels();
    hotels = ObservableList.of(list);
  }


  @action
  Future<void> addHotel(Hotel hotel) async {
    final newHotel = await _api.addHotel(hotel);
    hotels.add(newHotel);
  }
}
