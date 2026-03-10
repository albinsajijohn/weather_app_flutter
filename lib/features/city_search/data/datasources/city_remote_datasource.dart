import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/city_api_constants.dart';
import '../../../../core/network/network_client.dart';
import '../models/city_model.dart';

class CityRemoteDataSource {
  CityRemoteDataSource(this._networkClient);
  final NetworkClient _networkClient;

  Future<List<CityModel>> searchCities(String cityName) async {
    final response = await _networkClient.get(
      ApiConstants.geoSearch,
      queryParameters: {
        CityApiConstants.queryName: cityName,
        CityApiConstants.count: 10,
      },
    );

    final results = response.data[CityApiConstants.results];

    if (results == null || results is! List) {
      return [];
    }

    return results.map<CityModel>((json) => CityModel.fromJson(json)).toList();
  }
}
