import '../entities/city_entity.dart';

abstract class CityRepository {
  Future<List<CityEntity>> searchCities(String cityName);
}