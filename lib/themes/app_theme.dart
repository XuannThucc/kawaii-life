import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
import 'app_colors.dart';

final ThemeData lightMode = ThemeData.light().copyWith(
  accentColor: Colors.white.withOpacity(0.1),

);


final ThemeData darkMode = ThemeData.dark().copyWith(
  accentColor: Colors.black.withOpacity(0.1),
);

final TextStyle cardTextStyle = TextStyle(
  color: Colors.black,
  fontSize: s(16),
  fontWeight: FontWeight.w700,
);

final TextStyle detailTextStyle = GoogleFonts.sarabun(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.black
);

TextStyle robotoW400(double size, Color color) => GoogleFonts.roboto(
  fontSize: size,
  fontWeight: FontWeight.w400,
  color: color
);
TextStyle robotoW500(double size, Color color) => GoogleFonts.roboto(
    fontSize: size,
    fontWeight: FontWeight.w500,
    color: color
);
TextStyle robotoW600(double size, Color color) => GoogleFonts.roboto(
    fontSize: size,
    fontWeight: FontWeight.w600,
    color: color
);
TextStyle robotoW700(double size, Color color) => GoogleFonts.roboto(
    fontSize: size,
    fontWeight: FontWeight.w700,
    color: color
);


