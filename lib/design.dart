import 'package:flutter/material.dart';

class Design {
  static const Color primary = Color(0xFF6C63FF); // Modern Purple
  static const Color darkPrimary = Color(0xFF5A52D5);
  static const Color secondary = Color(0xFFFF6584); // Soft Red/Pink
  static const Color darkSecondary = Color(0xFFE55773);

  static const Color accent = Color(0xFFFFA726); // Warm Orange for highlights

  static const Color lightText = Colors.white;
  static const Color darkText = Color(0xFF2D2D2D);

  // Gradients
  static const LinearGradient focusGradient = LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF463FD6)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient chillGradient = LinearGradient(
    colors: [Color(0xFFFF6584), Color(0xFFFF8FA3)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
