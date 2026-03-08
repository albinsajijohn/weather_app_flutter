// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CitySearchPage]
class CitySearchRoute extends PageRouteInfo<void> {
  const CitySearchRoute({List<PageRouteInfo>? children})
    : super(CitySearchRoute.name, initialChildren: children);

  static const String name = 'CitySearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CitySearchPage();
    },
  );
}

/// generated route for
/// [CurrentWeatherPage]
class CurrentWeatherRoute extends PageRouteInfo<CurrentWeatherRouteArgs> {
  CurrentWeatherRoute({
    required String cityName,
    required double latitude,
    required double longitude,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         CurrentWeatherRoute.name,
         args: CurrentWeatherRouteArgs(
           cityName: cityName,
           latitude: latitude,
           longitude: longitude,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'CurrentWeatherRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CurrentWeatherRouteArgs>();
      return CurrentWeatherPage(
        cityName: args.cityName,
        latitude: args.latitude,
        longitude: args.longitude,
        key: args.key,
      );
    },
  );
}

class CurrentWeatherRouteArgs {
  const CurrentWeatherRouteArgs({
    required this.cityName,
    required this.latitude,
    required this.longitude,
    this.key,
  });

  final String cityName;

  final double latitude;

  final double longitude;

  final Key? key;

  @override
  String toString() {
    return 'CurrentWeatherRouteArgs{cityName: $cityName, latitude: $latitude, longitude: $longitude, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CurrentWeatherRouteArgs) return false;
    return cityName == other.cityName &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        key == other.key;
  }

  @override
  int get hashCode =>
      cityName.hashCode ^ latitude.hashCode ^ longitude.hashCode ^ key.hashCode;
}

/// generated route for
/// [ForecastPage]
class ForecastRoute extends PageRouteInfo<ForecastRouteArgs> {
  ForecastRoute({
    required String cityName,
    required double latitude,
    required double longitude,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ForecastRoute.name,
         args: ForecastRouteArgs(
           cityName: cityName,
           latitude: latitude,
           longitude: longitude,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ForecastRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForecastRouteArgs>();
      return ForecastPage(
        cityName: args.cityName,
        latitude: args.latitude,
        longitude: args.longitude,
        key: args.key,
      );
    },
  );
}

class ForecastRouteArgs {
  const ForecastRouteArgs({
    required this.cityName,
    required this.latitude,
    required this.longitude,
    this.key,
  });

  final String cityName;

  final double latitude;

  final double longitude;

  final Key? key;

  @override
  String toString() {
    return 'ForecastRouteArgs{cityName: $cityName, latitude: $latitude, longitude: $longitude, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ForecastRouteArgs) return false;
    return cityName == other.cityName &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        key == other.key;
  }

  @override
  int get hashCode =>
      cityName.hashCode ^ latitude.hashCode ^ longitude.hashCode ^ key.hashCode;
}
