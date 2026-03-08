import '../../../../core/constants/weather_api_constants.dart';
import '../../../../core/network/network_client.dart';
import '../models/forecast_model.dart';

class ForecastRemoteDatasource {
  ForecastRemoteDatasource(this._networkClient);
  final NetworkClient _networkClient;

  Future<List<ForecastModel>> getForecast(
    double latitude,
    double longitude,
  ) async {
    final response = await _networkClient.get(
      WeatherApiConstants.forecast,
      queryParameters: {
        WeatherApiConstants.latitude: latitude,
        WeatherApiConstants.longitude: longitude,

        /// forecast specific parameters
        "daily": "weathercode,temperature_2m_max,temperature_2m_min",
        "timezone": "auto",
      },
    );

    return ForecastModel.fromJson(response.data);
  }
}
