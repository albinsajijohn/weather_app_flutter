import 'package:equatable/equatable.dart';

import '../../domain/entities/city_entity.dart';

abstract class CitySearchState extends Equatable {
  const CitySearchState();

  @override
  List<Object?> get props => [];
}

class CitySearchInitial extends CitySearchState {}

class CitySearchLoading extends CitySearchState {}

class CitySearchLoaded extends CitySearchState {
  const CitySearchLoaded(this.cities);
  final List<CityEntity> cities;

  @override
  List<Object?> get props => [cities];
}

class CitySearchError extends CitySearchState {
  const CitySearchError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
