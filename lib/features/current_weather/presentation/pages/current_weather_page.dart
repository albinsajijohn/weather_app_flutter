import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_gradients.dart';
import '../../../../core/network/network_client.dart';
import '../../data/datasources/weather_remote_datasource.dart';
import '../../data/repositories/weather_repository_impl.dart';
import '../../domain/usecases/get_current_weather_usecase.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';
import '../widgets/weather_card.dart';

@RoutePage()
class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({
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
    return BlocProvider(
      create: (_) => WeatherBloc(
        GetCurrentWeatherUseCase(
          WeatherRepositoryImpl(
            WeatherRemoteDatasource(NetworkClient(ApiConstants.weatherBaseUrl)),
          ),
        ),
      )..add(FetchWeatherEvent(latitude, longitude)),
      child: CurrentWeatherView(cityName: cityName),
    );
  }
}

class CurrentWeatherView extends StatelessWidget {
  const CurrentWeatherView({required this.cityName, super.key});
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cityName, style: const TextStyle(color: Colors.white)),
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
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is WeatherLoaded) {
              final weather = state.weather;

              return Center(child: WeatherCard(weather: weather));
            }

            if (state is WeatherError) {
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
