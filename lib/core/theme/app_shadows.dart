import 'package:flutter/material.dart';

/// Design tokens for Elevation & Drop Shadows.
abstract final class AppShadows {
  static const List<BoxShadow> shadow100 = [
    BoxShadow(
      color: Color.fromRGBO(19, 25, 39, 0.08),
      blurRadius: 4,
      offset: Offset(0, 4),
      spreadRadius: -2,
    ),
    BoxShadow(
      color: Color.fromRGBO(19, 25, 39, 0.12),
      blurRadius: 4,
      offset: Offset(0, 2),
      spreadRadius: -2,
    ),
  ];

  static const List<BoxShadow> shadow200 = [
    BoxShadow(
      color: Color.fromRGBO(19, 25, 39, 0.08),
      blurRadius: 8,
      offset: Offset(0, 8),
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Color.fromRGBO(19, 25, 39, 0.12),
      blurRadius: 6,
      offset: Offset(0, 4),
      spreadRadius: -4,
    ),
  ];

  static const List<BoxShadow> shadow400 = [
    BoxShadow(
      color: Color.fromRGBO(19, 25, 39, 0.08),
      blurRadius: 24,
      offset: Offset(0, 8),
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Color.fromRGBO(19, 25, 39, 0.12),
      blurRadius: 12,
      offset: Offset(0, 6),
      spreadRadius: -6,
    ),
  ];
}
