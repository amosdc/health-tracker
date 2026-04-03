import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterFlowTheme {
  FlutterFlowTheme._();

  static FlutterFlowTheme of(BuildContext context) => FlutterFlowTheme._();

  // ── Colors ──────────────────────────────────────────────────────────────────
  Color get primary => const Color(0xFF6C63FF);
  Color get primaryText => Colors.white;
  Color get secondaryText => const Color(0xFF8A8FA8);
  Color get primaryBackground => const Color(0xFF0F1117);
  Color get secondaryBackground => const Color(0xFF1C1F2B);
  Color get alternate => const Color(0xFF2A2D3E);

  // ── Text Styles ─────────────────────────────────────────────────────────────
  TextStyle get displaySmall => GoogleFonts.interTight(
        fontSize: 36,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.normal,
        color: Colors.white,
      );

  TextStyle get headlineMedium => GoogleFonts.interTight(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        color: Colors.white,
      );

  TextStyle get headlineSmall => GoogleFonts.interTight(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        color: Colors.white,
      );

  TextStyle get titleMedium => GoogleFonts.interTight(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: Colors.white,
      );

  TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: const Color(0xFF8A8FA8),
      );

  TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: const Color(0xFF8A8FA8),
      );

  TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: const Color(0xFF8A8FA8),
      );
}
