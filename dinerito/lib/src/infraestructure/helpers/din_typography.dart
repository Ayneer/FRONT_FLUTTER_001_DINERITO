import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'din_colors.dart';

class DinTypography {
  static final titleBoldStyle1 = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 75,
  );
  static final titleSemiBoldStyle1 = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: DinColors.primaryColor001
  );

  static final textBoldStyle1 = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: DinColors.primaryColor002
  );
  static final subTitleMediumStyle1 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: DinColors.primaryColor003
  );

  static final linkMediumStyle1 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    decoration: TextDecoration.underline,
    color: DinColors.primaryColor003
  );
  static final linkBoldStyle1 = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    decoration: TextDecoration.underline
  );
}
