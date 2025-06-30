import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context.dart';

import '../models/location_error_type.dart';

class LocationErrorCta extends StatelessWidget {
  const LocationErrorCta({
    required this.errorType,
    required this.onUseMyLocationPressed,
    required this.onEnableLocationPressed,
    required this.onSearchLocationPressed,
    super.key,
  });

  final LocationErrorType errorType;
  final VoidCallback? onUseMyLocationPressed;
  final VoidCallback onEnableLocationPressed;
  final VoidCallback onSearchLocationPressed;

  @override
  Widget build(BuildContext context) {
    Widget cta;
    switch (errorType) {
      case LocationErrorType.permissionDenied:
      case LocationErrorType.permissionPermanentlyDenied:
      case LocationErrorType.locationServicesDisabled:
        cta = FilledButton(
          onPressed: onEnableLocationPressed,
          child: Text(context.l10n.enableLocation),
        );
        break;

      default:
        cta = FilledButton(
          onPressed: onUseMyLocationPressed,
          child: Text(context.l10n.useMyLocation),
        );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        cta,
        OutlinedButton(
          onPressed: onSearchLocationPressed,
          child: Text(context.l10n.search),
        ),
      ],
    );
  }
}
