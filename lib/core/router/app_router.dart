import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/city_search/presentation/pages/city_search_page.dart';
import '../../features/current_weather/presentation/pages/current_weather_page.dart';
import '../../features/forecast/presentation/pages/forecast_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CitySearchRoute.page, initial: true),
    AutoRoute(page: CurrentWeatherRoute.page),
    AutoRoute(page: ForecastRoute.page),
  ];
}
