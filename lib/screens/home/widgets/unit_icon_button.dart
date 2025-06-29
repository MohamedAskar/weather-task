import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/core/extensions/text_style.dart';
import 'package:weather/models/unit.dart';
import 'package:weather/services/unit/unit_service.dart';

class UnitIconButton extends ConsumerWidget {
  const UnitIconButton({super.key, required this.onUnitChange});

  final ValueChanged<Unit> onUnitChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUnit = ref.watch(unitServiceProvider);

    final nextUnit = selectedUnit == Unit.metric ? Unit.imperial : Unit.metric;

    void onPressed() {
      onUnitChange(nextUnit);
    }

    return IconButton(
      onPressed: onPressed,
      visualDensity: VisualDensity.compact,
      icon: Text(nextUnit.symbol, style: context.textTheme.bodyLarge?.bold),
    );
  }
}
