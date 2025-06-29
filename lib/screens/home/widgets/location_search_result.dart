import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/core/extensions/text_style.dart';
import 'package:weather/models/city_suggestion.dart';
import 'package:weather/services/search/search_service.dart';
import 'package:weather/services/unit/unit_service.dart';
import 'package:weather/services/weather/weather_service.dart';
import 'package:weather/widgets/weather_empty_widget.dart';
import 'package:weather/widgets/weather_error_widget.dart';

import '../controller/home_controller.dart';

class LocationSearchResult extends ConsumerWidget {
  const LocationSearchResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCode = context.languageCode;
    final searchQuery = ref.watch(
      homeControllerProvider.select((state) => state.searchController.text),
    );
    final unit = ref.watch(unitServiceProvider);
    final searchResultsAsync = ref.watch(searchServiceProvider);

    void onTap(CitySuggestion city) {
      ref.read(homeControllerProvider.notifier).onSearchResultTap(city);
      ref
          .read(weatherServiceProvider.notifier)
          .get(
            lat: city.lat,
            lon: city.lon,
            languageCode: languageCode,
            unit: unit.name,
          );
    }

    return searchResultsAsync.when(
      loading: () {
        return const SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()),
        );
      },
      error: (error, _) {
        return SliverFillRemaining(
          child: WeatherErrorWidget(
            error: error.toString(),
            onTryAgain: () => ref.invalidate(searchServiceProvider),
          ),
        );
      },
      data: (data) {
        if (data.isEmpty && searchQuery.isNotEmpty) {
          return SliverFillRemaining(
            child: WeatherEmptyWidget(message: context.l10n.noResults),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          sliver: SliverList.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final city = data[index];
              return ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                title: Text(
                  city.name,
                  style: context.textTheme.titleMedium?.semibold,
                ),
                subtitle: Text(
                  [city.state, city.country].where((e) => e != null).join(', '),
                  style: context.textTheme.bodySmall,
                ),
                onTap: () => onTap(city),
              );
            },
          ),
        );
      },
    );
  }
}
