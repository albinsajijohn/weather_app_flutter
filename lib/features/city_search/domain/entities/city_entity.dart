class CityEntity {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final String country;
  final String admin1;
  final String? admin2; // district (nullable)

  const CityEntity({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.admin1,
    this.admin2,
  });
}