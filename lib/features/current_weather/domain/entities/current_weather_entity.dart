class CurrentWeatherEntity {
  const CurrentWeatherEntity({
    required this.temperature,
    required this.windspeed,
    required this.weatherCode,
  });
  final double temperature;
  final double windspeed;
  final int weatherCode;
}
