import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {
  const Colors();

  static const Color loginGradientStart = const Color(0xFF3e87ff);
  static const Color loginGradientEnd = const Color(0xFFfc0022);
  static const Color loginGradientButtonEnd = const Color(0xFFfd4577);
  static const Color loginGradientButtonStart = const Color(0xFF45fe67);


  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
