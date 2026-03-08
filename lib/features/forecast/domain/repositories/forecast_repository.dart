import '../entities/forecast_entity.dart';

abstract class ForecastRepository {

  Future<List<ForecastEntity>> getForecast(
    double latitude,
    double longitude,
  );

}