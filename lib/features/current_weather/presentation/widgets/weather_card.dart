import 'package:flutter/material.dart';

import '../../../../core/utils/weather_utils.dart';
import '../../domain/entities/current_weather_entity.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({required this.weather, super.key});

  final CurrentWeatherEntity weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF3A1C71), Color(0xFF00C9FF)],
        ),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            WeatherUtils.getWeatherIcon(weather.weatherCode),
            style: const TextStyle(fontSize: 70),
          ),

          const SizedBox(height: 10),

          Text(
            "${weather.temperature.toStringAsFixed(1)}°C",
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            WeatherUtils.getWeatherDescription(weather.weatherCode),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.air, color: Colors.white70),
              const SizedBox(width: 6),
              Text(
                "${weather.windspeed.toStringAsFixed(1)} km/h",
                style: const TextStyle(color: Colors.white70),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
