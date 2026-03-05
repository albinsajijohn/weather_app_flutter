import '../../../../core/constants/weather_api_constants.dart';
import '../../../../core/network/network_client.dart';
import '../models/current_weather_model.dart';

class WeatherRemoteDatasource {
  WeatherRemoteDatasource(this._networkClient);
  final NetworkClient _networkClient;

  Future<CurrentWeatherModel> getCurrentWeather(
    double latitude,
    double longitude,
  ) async {
    final response = await _networkClient.get(
      WeatherApiConstants.forecast,
      queryParameters: {
        WeatherApiConstants.latitude: latitude,
        WeatherApiConstants.longitude: longitude,
        WeatherApiConstants.currentWeather: true,
      },
    );

    return CurrentWeatherModel.fromJson(response.data);
  }
}
