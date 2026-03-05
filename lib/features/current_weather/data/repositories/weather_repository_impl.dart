import '../../domain/entities/current_weather_entity.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_remote_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl(this.remoteDatasource);
  final WeatherRemoteDatasource remoteDatasource;

  @override
  Future<CurrentWeatherEntity> getCurrentWeather(
    double latitude,
    double longitude,
  ) async {
    return await remoteDatasource.getCurrentWeather(latitude, longitude);
  }
}
