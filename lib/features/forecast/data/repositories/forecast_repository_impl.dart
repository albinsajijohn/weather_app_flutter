import '../../domain/entities/forecast_entity.dart';
import '../../domain/repositories/forecast_repository.dart';
import '../datasources/forecast_remote_datasource.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  ForecastRepositoryImpl(this._remoteDatasource);

  final ForecastRemoteDatasource _remoteDatasource;

  @override
  Future<List<ForecastEntity>> getForecast(
    double latitude,
    double longitude,
  ) async {
    final forecastModels = await _remoteDatasource.getForecast(
      latitude,
      longitude,
    );

    return forecastModels;
  }
}
