import '../../../../core/network/network_client.dart';
import '../models/city_model.dart';

class CityRemoteDataSource {
  final NetworkClient _networkClient;

  CityRemoteDataSource(this._networkClient);

  Future<List<CityModel>> searchCities(String cityName) async {
    final response = await _networkClient.get(
      '/search',
      queryParameters: {
        'name': cityName,
        'count': 10,
      },
    );

    final results = response.data['results'];

    // 🛡️ null & type safety
    if (results == null || results is! List) {
      return [];
    }

    return results
        .map<CityModel>((json) => CityModel.fromJson(json))
        .toList();
  }
}