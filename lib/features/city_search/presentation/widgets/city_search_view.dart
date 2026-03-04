import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/city_api_constants.dart';
import '../bloc/city_search_bloc.dart';
import '../bloc/city_search_event.dart';
import '../bloc/city_search_state.dart';

class CitySearchView extends StatelessWidget {
  CitySearchView({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text(CityApiConstants.kTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: CityApiConstants.kHintText,

                prefixIcon: const Icon(Icons.search),

                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    context.read<CitySearchBloc>().add(
                      const SearchCityEvent(''),
                    );
                  },
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),

                filled: true,
                fillColor: Colors.white,
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
                    child: Text(CityApiConstants.kCentreText),
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
