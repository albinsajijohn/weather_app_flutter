import '../../domain/entities/forecast_entity.dart';

abstract class ForecastState {
  const ForecastState();
}

class ForecastInitial extends ForecastState {}

class ForecastLoading extends ForecastState {}

class ForecastLoaded extends ForecastState {
  const ForecastLoaded(this.forecasts);
  final List<ForecastEntity> forecasts;
}

class ForecastError extends ForecastState {
  const ForecastError(this.message);
  final String message;
}
