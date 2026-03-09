import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_gradients.dart';
import '../../../../core/utils/weather_days.dart';
import '../../../../core/utils/weather_utils.dart';
import '../bloc/forecast_bloc.dart';
import '../bloc/forecast_event.dart';
import '../bloc/forecast_state.dart';

class ForecastView extends StatelessWidget {
  const ForecastView({
    required this.cityName,
    required this.latitude,
    required this.longitude,
    super.key,
  });

  final String cityName;
  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$cityName - 7 Day Forecast",
          style: const TextStyle(color: Colors.white),
        ),
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

        child: RefreshIndicator(
          onRefresh: () async {
            context.read<ForecastBloc>().add(
              FetchForecastEvent(latitude, longitude),
            );
          },

          child: BlocBuilder<ForecastBloc, ForecastState>(
            builder: (context, state) {
              /// Loading
              if (state is ForecastLoading) {
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    SizedBox(height: 300),
                    Center(child: CircularProgressIndicator()),
                  ],
                );
              }

              /// Loaded
              if (state is ForecastLoaded) {
                final forecasts = state.forecasts;

                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  itemCount: forecasts.length,
                  itemBuilder: (context, index) {
                    final forecast = forecasts[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 18,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: AppGradients.forecastCardGradient,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .25),
                            blurRadius: 10,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),

                      child: Row(
                        children: [
                          /// Weather Icon
                          Container(
                            width: 55,
                            height: 55,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: .15),
                            ),
                            child: Text(
                              WeatherUtils.getWeatherIcon(forecast.weatherCode),
                              style: const TextStyle(fontSize: 28),
                            ),
                          ),

                          const SizedBox(width: 16),

                          /// Day + Description
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  WeatherDays.getDayLabel(forecast.date),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  WeatherUtils.getWeatherDescription(
                                    forecast.weatherCode,
                                  ),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// Temperature
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "${forecast.maxTemp.toStringAsFixed(1)}°",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              Text(
                                "${forecast.minTemp.toStringAsFixed(1)}°",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }

              /// Error
              if (state is ForecastError) {
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    const SizedBox(height: 300),
                    Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
