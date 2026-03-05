import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CurrentWeatherPage extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String cityName;

  const CurrentWeatherPage({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
      ),
      body: Center(
        child: Text(
          'Latitude: $latitude\nLongitude: $longitude',
        ),
      ),
    );
  }
}