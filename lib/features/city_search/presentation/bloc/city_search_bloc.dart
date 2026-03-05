import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/search_cities_usecase.dart';
import 'city_search_event.dart';
import 'city_search_state.dart';

class CitySearchBloc extends Bloc<CitySearchEvent, CitySearchState> {
  CitySearchBloc(this._searchCitiesUseCase) : super(CitySearchInitial()) {
    on<SearchCityEvent>(_onSearchCity);
  }
  final SearchCitiesUseCase _searchCitiesUseCase;

  Future<void> _onSearchCity(
    SearchCityEvent event,
    Emitter<CitySearchState> emit,
  ) async {
    emit(CitySearchLoading());

    try {
      final cities = await _searchCitiesUseCase(event.cityName);

      emit(CitySearchLoaded(cities));
    } catch (e) {
      emit(CitySearchError(e.toString()));
    }
  }
}
