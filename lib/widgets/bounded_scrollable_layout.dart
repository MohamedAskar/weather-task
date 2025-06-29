import 'package:flutter/material.dart';

import '../core/constants/dimensions.dart';

class BoundedScrollableLayout extends StatelessWidget {
  const BoundedScrollableLayout({
    super.key,
    required this.child,
    this.maxWidth = Dimensions.viewMaxWidth,
    this.padding,
  });

  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Center(
        child: Container(
          padding: padding,
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}
