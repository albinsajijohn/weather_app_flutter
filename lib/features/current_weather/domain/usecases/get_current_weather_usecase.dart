import '../entities/current_weather_entity.dart';
import '../repositories/weather_repository.dart';

class GetCurrentWeatherUseCase {
  GetCurrentWeatherUseCase(this.repository);
  final WeatherRepository repository;

  Future<CurrentWeatherEntity> call(double latitude, double longitude) {
    return repository.getCurrentWeather(latitude, longitude);
  }
}
