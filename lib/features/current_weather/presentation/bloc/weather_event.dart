abstract class WeatherEvent {
  const WeatherEvent();
}

class FetchWeatherEvent extends WeatherEvent {
  const FetchWeatherEvent(this.latitude, this.longitude);
  final double latitude;
  final double longitude;
}
