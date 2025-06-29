import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/home_controller.dart';

class SearchIconButton extends ConsumerWidget {
  const SearchIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      onPressed: () {
        ref.read(homeControllerProvider.notifier).openSearchSheet();
      },
      icon: const Icon(Icons.explore_outlined, size: 24),
    );
  }
}
