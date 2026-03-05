import '../../../../core/constants/weather_api_constants.dart';
import '../../domain/entities/current_weather_entity.dart';

class CurrentWeatherModel extends CurrentWeatherEntity {
  const CurrentWeatherModel({
    required super.temperature,
    required super.windspeed,
    required super.weatherCode,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    final weather = json['current_weather'];

    return CurrentWeatherModel(
      temperature: (weather[WeatherApiConstants.temperature]).toDouble(),
      windspeed: (weather[WeatherApiConstants.windspeed]).toDouble(),
      weatherCode: weather[WeatherApiConstants.weathercode],
    );
  }
}
