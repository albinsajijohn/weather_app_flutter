import '../../domain/entities/city_entity.dart';
import '../../../../core/constants/city_api_constants.dart';

class CityModel extends CityEntity {
  const CityModel({
    required super.id,
    required super.name,
    required super.latitude,
    required super.longitude,
    required super.country,
    required super.admin1,
    super.admin2,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json[CityApiConstants.id] ?? 0,
      name: json[CityApiConstants.name] ?? '',
      latitude: (json[CityApiConstants.latitude] ?? 0).toDouble(),
      longitude: (json[CityApiConstants.longitude] ?? 0).toDouble(),
      country: json[CityApiConstants.country] ?? '',
      admin1: json[CityApiConstants.admin1] ?? '',
      admin2: json[CityApiConstants.admin2],
    );
  }
}