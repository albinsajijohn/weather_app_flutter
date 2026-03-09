import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_gradients.dart';
import '../../../../core/constants/current_weather_constants.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';
import 'weather_card.dart';

class CurrentWeatherView extends StatelessWidget {
  const CurrentWeatherView({
    required this.cityName,
    required this.latitude,
    required this.longitude,
    required this.onForecastTap,
    super.key,
  });

  final String cityName;
  final double latitude;
  final double longitude;
  final VoidCallback onForecastTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          cityName,
          style: const TextStyle(color: Colors.white),
        ),
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
            context.read<WeatherBloc>().add(
              FetchWeatherEvent(latitude, longitude),
            );
          },

          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {

              /// Loading
              if (state is WeatherLoading) {
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    SizedBox(height: 300),
                    Center(child: CircularProgressIndicator()),
                  ],
                );
              }

              /// Loaded
             if (state is WeatherLoaded) {
  final weather = state.weather;

  return LayoutBuilder(
    builder: (context, constraints) {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                WeatherCard(weather: weather),

                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: onForecastTap,
                  child: const Text(CurrentWeatherConstants.kbutton),
                ),

              ],
            ),
          ),
        ),
      );
    },
  );
}
              /// Error
              if (state is WeatherError) {
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