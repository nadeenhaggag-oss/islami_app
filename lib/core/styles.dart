import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle titleStyle = GoogleFonts.elMessiri(
    fontSize: 24,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bodyStyle = GoogleFonts.elMessiri(
    fontSize: 20,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle large = GoogleFonts.elMessiri(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
