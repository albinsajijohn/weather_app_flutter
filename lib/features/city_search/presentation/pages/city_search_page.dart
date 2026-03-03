import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/network_client.dart';
import '../../data/datasources/city_remote_datasource.dart';
import '../../data/repositories/city_repository_impl.dart';
import '../../domain/usecases/search_cities_usecase.dart';
import '../bloc/city_search_bloc.dart';
import '../bloc/city_search_event.dart';
import '../bloc/city_search_state.dart';

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
      child: const CitySearchView(),
    );
  }
}

class CitySearchView extends StatefulWidget {
  const CitySearchView({super.key});

  @override
  State<CitySearchView> createState() => _CitySearchViewState();
}

class _CitySearchViewState extends State<CitySearchView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('City Search')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Search city...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<CitySearchBloc>().add(SearchCityEvent(value));
              },
            ),

            const SizedBox(height: 16),

            Expanded(
              child: BlocBuilder<CitySearchBloc, CitySearchState>(
                builder: (context, state) {
                  if (state is CitySearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is CitySearchLoaded) {
                    return ListView.builder(
                      itemCount: state.cities.length,
                      itemBuilder: (context, index) {
                        final city = state.cities[index];
                        return ListTile(
                          title: Text(city.name),
                          subtitle: Text(city.admin2 ?? city.admin1),
                        );
                      },
                    );
                  }

                  if (state is CitySearchError) {
                    return Center(child: Text(state.message));
                  }

                  return const Center(
                    child: Text('Start searching for a city'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
