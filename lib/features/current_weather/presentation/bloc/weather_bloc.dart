import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_current_weather_usecase.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.getCurrentWeatherUseCase) : super(WeatherInitial()) {
    on<FetchWeatherEvent>(_onFetchWeather);
  }
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;

  Future<void> _onFetchWeather(
    FetchWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());

    try {
      final weather = await getCurrentWeatherUseCase(
        event.latitude,
        event.longitude,
      );

      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
