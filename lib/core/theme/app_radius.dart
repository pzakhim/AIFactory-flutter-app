import 'package:flutter/material.dart';

/// Design tokens for Corner Radius.
abstract final class AppRadius {
  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 20.0;
  static const double xl = 24.0;
  static const double full = 999.0;

  static final BorderRadius buttonRadius = BorderRadius.circular(sm);
  static final BorderRadius cardRadius = BorderRadius.circular(sm);
  static final BorderRadius inputRadius = BorderRadius.circular(sm);
  static final BorderRadius modalRadius = BorderRadius.circular(lg);
  static final BorderRadius pillRadius = BorderRadius.circular(full);
}
