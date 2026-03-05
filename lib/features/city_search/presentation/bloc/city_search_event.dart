import 'package:equatable/equatable.dart';

abstract class CitySearchEvent extends Equatable {
  const CitySearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchCityEvent extends CitySearchEvent {
  const SearchCityEvent(this.cityName);
  final String cityName;

  @override
  List<Object?> get props => [cityName];
}
