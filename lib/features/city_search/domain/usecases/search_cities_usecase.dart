import '../entities/city_entity.dart';
import '../repositories/city_repository.dart';

class SearchCitiesUseCase {
  final CityRepository _repository;

  SearchCitiesUseCase(this._repository);

  Future<List<CityEntity>> call(String cityName) async {
    return await _repository.searchCities(cityName);
  }
}