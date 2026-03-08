import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_gradients.dart';
import '../../../../core/utils/weather_utils.dart';

import '../bloc/forecast_bloc.dart';
import '../bloc/forecast_state.dart';

class ForecastView extends StatelessWidget {
  const ForecastView({
    required this.cityName,
    super.key,
  });

  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$cityName - 7 Day Forecast"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.appBarGradient,
          ),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.scaffoldGradient,
        ),

        child: BlocBuilder<ForecastBloc, ForecastState>(
          builder: (context, state) {

            /// Loading State
            if (state is ForecastLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            /// Loaded State
            if (state is ForecastLoaded) {
              final forecasts = state.forecasts;

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: forecasts.length,
                itemBuilder: (context, index) {

                  final forecast = forecasts[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Text(
                        WeatherUtils.getWeatherIcon(
                          forecast.weatherCode,
                        ),
                        style: const TextStyle(fontSize: 28),
                      ),

                      title: Text(
                        forecast.date,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        WeatherUtils.getWeatherDescription(
                          forecast.weatherCode,
                        ),
                      ),

                      trailing: Text(
                        "${forecast.maxTemp.toStringAsFixed(1)}° / ${forecast.minTemp.toStringAsFixed(1)}°",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            /// Error State
            if (state is ForecastError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}