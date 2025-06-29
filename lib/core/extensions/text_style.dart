import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w900);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get semibold => copyWith(fontWeight: FontWeight.w500);
}
