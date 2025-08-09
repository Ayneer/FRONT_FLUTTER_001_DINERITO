import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'din_colors.dart';

class DinTypography {
  static const FontWeight _light = FontWeight.w300;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _bold = FontWeight.w700;
  static const double _sizeSmall = 10;
  static const double _sizeMsmall = 13;
  static const double _sizeMedium = 15;
  static const double _sizeLarge = 25;

  static final titleBoldStyle1 = GoogleFonts.poppins(
    fontWeight: _bold,
    fontSize: 75,
    color: DinColors.primaryColor001,
  );
  static final titleBoldStyle2 = GoogleFonts.poppins(
      fontWeight: _bold,
      fontSize: _sizeLarge,
      color: DinColors.primaryColor001);
  static final titleSemiBoldStyle1 = GoogleFonts.poppins(
    fontWeight: _bold,
    fontSize: 20,
  );

  static final subTitleMediumStyle1 = GoogleFonts.poppins(
    fontWeight: _medium,
    fontSize: 13,
    color: DinColors.primaryColor003,
  );

  //BODY TEXT STYLES
  static final textBoldStyle1 = GoogleFonts.poppins(
    fontWeight: _bold,
    fontSize: _sizeMedium,
    color: DinColors.primaryColor002,
  );
  static final textBoldStyle2 = GoogleFonts.poppins(
    fontWeight: _bold,
    fontSize: _sizeMedium,
    color: DinColors.primaryColor001,
  );
  static final textLightStyle1 = GoogleFonts.poppins(
    fontWeight: _light,
    fontSize: _sizeMedium,
    color: DinColors.primaryColor001,
  );
  static final textLightMsmallStyle1 = GoogleFonts.poppins(
    fontWeight: _light,
    fontSize: _sizeMsmall,
    color: DinColors.primaryColor001,
  );

  static final linkMediumStyle1 = GoogleFonts.poppins(
    fontWeight: _medium,
    fontSize: 13,
    decoration: TextDecoration.underline,
    color: DinColors.primaryColor003,
  );
  static final linkBoldStyle1 = GoogleFonts.poppins(
    fontWeight: _bold,
    fontSize: 13,
    decoration: TextDecoration.underline,
    color: DinColors.primaryColor001,
  );

  static final moneyBoldSmallStyle1 = GoogleFonts.poppins(
    fontWeight: _bold,
    fontSize: _sizeSmall,
    color: DinColors.primaryColor001,
  );
  static final moneyBoldMediumStyle1 = GoogleFonts.poppins(
    fontWeight: _medium,
    fontSize: _sizeMedium,
    color: DinColors.primaryColor001,
  );
}
