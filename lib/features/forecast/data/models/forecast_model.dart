import '../../domain/entities/forecast_entity.dart';

class ForecastModel extends ForecastEntity {
  const ForecastModel({
    required super.date,
    required super.maxTemp,
    required super.minTemp,
    required super.weatherCode,
  });

  
  static List<ForecastModel> fromJson(Map<String, dynamic> json) {

    final daily = json['daily'];

    final List times = daily['time'];
    final List maxTemps = daily['temperature_2m_max'];
    final List minTemps = daily['temperature_2m_min'];
    final List weatherCodes = daily['weathercode'];

    List<ForecastModel> forecastList = [];

    for (int i = 0; i < times.length; i++) {
      forecastList.add(
        ForecastModel(
          date: times[i],
          maxTemp: (maxTemps[i]).toDouble(),
          minTemp: (minTemps[i]).toDouble(),
          weatherCode: weatherCodes[i],
        ),
      );
    }

    return forecastList;
  }
}