import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_gradients.dart';
import '../../../../core/constants/forecast_constants.dart';

import '../bloc/forecast_bloc.dart';
import '../bloc/forecast_event.dart';
import '../bloc/forecast_state.dart';
import 'forecast_card.dart';

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
          "$cityName ${ForecastConstants.kTitleForecast}",
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
            
              if (state is ForecastLoading) {
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    SizedBox(height: 300),
                    Center(child: CircularProgressIndicator()),
                  ],
                );
              }

           
              if (state is ForecastLoaded) {
                final forecasts = state.forecasts;

                return ForecastCard(forecasts: forecasts);
              }

           
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

