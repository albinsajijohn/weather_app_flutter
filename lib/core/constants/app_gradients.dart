import 'package:flutter/material.dart';

class AppGradients {
  // AppBar Gradient
  static const LinearGradient appBarGradient = LinearGradient(
    colors: [
      // Color(0xFF3A1C71),
      Color(0xFF00C9FF),
      Color(0xFF00C9FF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Scaffold Background Gradient
  static const LinearGradient scaffoldGradient = LinearGradient(
    colors: [
      Color(0xFF00C9FF),
      
      Color(0xFF3A1C71),
      Color(0xFF0F2027),
      
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Search Bar Gradient
  static const LinearGradient searchBarGradient = LinearGradient(
    colors: [
      Color(0xFF1F2A44),
      Color(0xFF3A1C71),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // City Card Gradient
  static const LinearGradient cityCardGradient = LinearGradient(
    colors: [
      Color(0xFF1F2A44),
      Color(0xFF3A1C71),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}