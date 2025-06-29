import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/models/unit.dart';
import 'package:weather/services/unit/unit_service.dart';

class UnitIconButton extends ConsumerWidget {
  const UnitIconButton({super.key, required this.onUnitChange});

  final ValueChanged<Unit> onUnitChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUnit = ref.watch(unitServiceProvider);

    return PopupMenuButton<Unit>(
      icon: const Icon(Icons.thermostat_outlined),
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onSelected: onUnitChange,

      itemBuilder: (context) {
        return Unit.values.map((unit) {
          return PopupMenuItem<Unit>(
            value: unit,
            child: ListTile(
              title: Text(context.l10n.unit(unit.name)),
              selected: unit == selectedUnit,
            ),
          );
        }).toList();
      },
    );
  }
}
