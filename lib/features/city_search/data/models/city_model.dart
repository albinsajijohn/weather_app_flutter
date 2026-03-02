import '../../domain/entities/city_entity.dart';

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
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
      country: json['country'] ?? '',
      admin1: json['admin1'] ?? '',
      admin2: json['admin2'],
    );
  }
}
