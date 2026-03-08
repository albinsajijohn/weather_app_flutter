import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_forecast_usecase.dart';
import 'forecast_event.dart';
import 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  ForecastBloc(this._getForecastUseCase) : super(ForecastInitial()) {
    on<FetchForecastEvent>(_onFetchForecast);
  }
  final GetForecastUseCase _getForecastUseCase;

  Future<void> _onFetchForecast(
    FetchForecastEvent event,
    Emitter<ForecastState> emit,
  ) async {
    emit(ForecastLoading());

    try {
      final forecasts = await _getForecastUseCase(
        event.latitude,
        event.longitude,
      );

      emit(ForecastLoaded(forecasts));
    } catch (e) {
      emit(ForecastError(e.toString()));
    }
  }
}
