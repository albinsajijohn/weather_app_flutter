import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_gradients.dart';
import '../../../../core/router/app_router.dart';
import '../../domain/entities/city_entity.dart';

class CityCard extends StatelessWidget {
  const CityCard({required this.city, super.key});
  final CityEntity city;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        gradient: AppGradients.cityCardGradient,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        leading: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFF00C9FF), Color(0xFF92FE9D)],
            ),
          ),
          child: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            child: Icon(Icons.location_city, color: Colors.white),
          ),
        ),

        title: Text(
          city.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        subtitle: Text(
          city.admin2 ?? city.admin1,
          style: const TextStyle(color: Colors.white70),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white54,
          size: 16,
        ),
        onTap: () {
  context.router.push(
    CurrentWeatherRoute(
      latitude: city.latitude,
      longitude: city.longitude,
      cityName: city.name,
    ),
  );
},
      ),
    );
  }
}
