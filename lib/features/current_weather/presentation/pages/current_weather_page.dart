import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/api_constants.dart';

import '../../../../core/network/network_client.dart';
import '../../../../core/router/app_router.dart';

import '../../data/datasources/weather_remote_datasource.dart';
import '../../data/repositories/weather_repository_impl.dart';
import '../../domain/usecases/get_current_weather_usecase.dart';

import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';


import '../widgets/current_weather_view.dart';


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
            WeatherRemoteDatasource(
              NetworkClient(ApiConstants.weatherBaseUrl),
            ),
          ),
        ),
      )..add(FetchWeatherEvent(latitude, longitude)),
      child: CurrentWeatherView(
        cityName: cityName,
        latitude: latitude,
        longitude: longitude,
        onForecastTap: () {
          context.router.push(
            ForecastRoute(
              cityName: cityName,
              latitude: latitude,
              longitude: longitude,
            ),
          );
        },
      ),
    );
  }
}

