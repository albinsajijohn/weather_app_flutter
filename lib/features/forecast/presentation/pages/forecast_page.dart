import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/network_client.dart';

import '../../data/datasources/forecast_remote_datasource.dart';
import '../../data/repositories/forecast_repository_impl.dart';

import '../../domain/usecases/get_forecast_usecase.dart';

import '../bloc/forecast_bloc.dart';
import '../bloc/forecast_event.dart';

import 'forecast_view.dart';

@RoutePage()
class ForecastPage extends StatelessWidget {
  const ForecastPage({
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
      create: (_) => ForecastBloc(
        GetForecastUseCase(
          ForecastRepositoryImpl(
            ForecastRemoteDatasource(
              NetworkClient(ApiConstants.weatherBaseUrl),
            ),
          ),
        ),
      )..add(FetchForecastEvent(latitude, longitude)),

      /// 👇 pass coordinates to view
      child: ForecastView(
        cityName: cityName,
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }
}