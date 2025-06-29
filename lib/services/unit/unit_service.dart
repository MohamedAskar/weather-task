import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather/models/unit.dart';
import 'package:weather/utils/shared-preferences/shared_preferences_provider.dart';

part 'unit_service.g.dart';

@riverpod
class UnitService extends _$UnitService {
  static const _storageKey = 'unit';

  @override
  Unit build() {
    final unitString = ref
        .read(sharedPreferencesProvider)
        .getString(_storageKey);

    final unit = Unit.values.firstWhereOrNull((e) => e.name == unitString);
    return unit ?? Unit.metric;
  }

  Future<void> setUnit(Unit unit) async {
    await ref.read(sharedPreferencesProvider).setString(_storageKey, unit.name);
    state = unit;
  }
}
