import '../../domain/entities/current_weather_entity.dart';

abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded(this.weather);
  final CurrentWeatherEntity weather;
}

class WeatherError extends WeatherState {
  const WeatherError(this.message);
  final String message;
}
