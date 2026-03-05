
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_gradients.dart';
import '../../../../core/constants/city_api_constants.dart';
import '../bloc/city_search_bloc.dart';
import '../bloc/city_search_event.dart';
import '../bloc/city_search_state.dart';
import 'city_card.dart';


class CitySearchView extends StatelessWidget {
  CitySearchView({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          CityApiConstants.kTitle,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.appBarGradient,
          ),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.scaffoldGradient,
        ),

        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: AppGradients.searchBarGradient,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withOpacity(0.15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.35),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _controller,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    hintText: CityApiConstants.kHintText,
                    hintStyle: const TextStyle(color: Colors.white60),

                    prefixIcon: const Icon(Icons.search, color: Colors.white70),

                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear, color: Colors.white70),
                      onPressed: () {
                        _controller.clear();
                        context.read<CitySearchBloc>().add(
                          const SearchCityEvent(''),
                        );
                      },
                    ),

                    border: InputBorder.none,

                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                  ),
                  onChanged: (value) {
                    context.read<CitySearchBloc>().add(SearchCityEvent(value));
                  },
                ),
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

                          return CityCard(city: city);
                        },
                      );
                    }

                    if (state is CitySearchError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return const Center(
                      child: Text(
                        CityApiConstants.kCentreText,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
