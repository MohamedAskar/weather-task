// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchServiceHash() => r'67d5dcf57f37ddd2b2338d037c86789622da6128';

/// See also [SearchService].
@ProviderFor(SearchService)
final searchServiceProvider =
    AutoDisposeNotifierProvider<
      SearchService,
      AsyncValue<List<CitySuggestion>>
    >.internal(
      SearchService.new,
      name: r'searchServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$searchServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SearchService = AutoDisposeNotifier<AsyncValue<List<CitySuggestion>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
