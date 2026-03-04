import '../../domain/entities/city_entity.dart';
import '../../domain/repositories/city_repository.dart';
import '../datasources/city_remote_datasource.dart';

class CityRepositoryImpl implements CityRepository {
  CityRepositoryImpl(this._remoteDataSource);
  final CityRemoteDataSource _remoteDataSource;

  @override
  Future<List<CityEntity>> searchCities(String cityName) async {
    try {
      final models = await _remoteDataSource.searchCities(cityName);

      // Since CityModel extends CityEntity,
      // we can safely return models as entities
      return models;
    } catch (e) {
      throw Exception('Failed to fetch cities: $e');
    }
  }
}
