import '../entities/forecast_entity.dart';
import '../repositories/forecast_repository.dart';

class GetForecastUseCase {
  GetForecastUseCase(this._repository);

  final ForecastRepository _repository;

  Future<List<ForecastEntity>> call(double latitude, double longitude) async {
    return await _repository.getForecast(latitude, longitude);
  }
}
