import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context.dart';

class TemperatureRangeIndicator extends StatelessWidget {
  const TemperatureRangeIndicator({
    super.key,
    required this.overallMinTemp,
    required this.overallMaxTemp,
    required this.dayMinTemp,
    required this.dayMaxTemp,
    this.width = 100,
    this.height = 4,
  });

  final int overallMinTemp;
  final int overallMaxTemp;
  final int dayMinTemp;
  final int dayMaxTemp;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final totalRange = overallMaxTemp - overallMinTemp;

    final startPosition = (dayMinTemp - overallMinTemp) / totalRange;
    final endPosition = (dayMaxTemp - overallMinTemp) / totalRange;
    final highlightWidth = (endPosition - startPosition) * width;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: context.colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(height / 2),
            ),
          ),
          Positioned(
            left: startPosition * width,
            child: Container(
              width: highlightWidth,
              height: height,
              decoration: BoxDecoration(
                color: context.colorScheme.onSurface,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
