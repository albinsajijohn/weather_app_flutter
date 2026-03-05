import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/network_client.dart';
import '../../data/datasources/city_remote_datasource.dart';
import '../../data/repositories/city_repository_impl.dart';
import '../../domain/usecases/search_cities_usecase.dart';
import '../bloc/city_search_bloc.dart';
import '../widgets/city_search_view.dart';
@RoutePage()
class CitySearchPage extends StatelessWidget {
  const CitySearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CitySearchBloc(
        SearchCitiesUseCase(
          CityRepositoryImpl(CityRemoteDataSource(NetworkClient())),
        ),
      ),
      child: CitySearchView(),
    );
  }
}

