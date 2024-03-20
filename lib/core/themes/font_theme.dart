import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle titleFontStyle(BuildContext context, Color textColor) {
  final deviceHeight = MediaQuery.of(context).size.height;

  return GoogleFonts.jost(
    fontWeight: FontWeight.w500,
    color: textColor,
    fontSize: deviceHeight * 0.027,
  );
}

TextStyle subTitleFontStyle(BuildContext context, Color textColor) {
  final deviceHeight = MediaQuery.of(context).size.height;

  return GoogleFonts.jost(
    fontWeight: FontWeight.w500,
    color: textColor,
    fontSize: deviceHeight * 0.026,
  );
}

TextStyle bodyFontStyle(BuildContext context, Color textColor) {
  final deviceHeight = MediaQuery.of(context).size.height;

  return GoogleFonts.jost(
    fontWeight: FontWeight.w500,
    color: textColor,
    fontSize: deviceHeight * 0.02,
  );
}

TextStyle smallFontStyle(BuildContext context, Color textColor) {
  final deviceHeight = MediaQuery.of(context).size.height;

  return GoogleFonts.jost(
    fontWeight: FontWeight.w500,
    color: textColor,
    fontSize: deviceHeight * 0.015,
  );
}
