abstract class ForecastEvent {
  const ForecastEvent();
}

class FetchForecastEvent extends ForecastEvent {
  const FetchForecastEvent(this.latitude, this.longitude);
  final double latitude;
  final double longitude;
}
