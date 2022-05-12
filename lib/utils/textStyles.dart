import 'package:flutter/widgets.dart';
import 'package:products/utils/colors.dart';

class AppTextStyles {
  static const bold =
      TextStyle(fontFamily: AppFonts.robotoBold, color: AppColors.white);
  static const regular =
      TextStyle(fontFamily: AppFonts.robotoRegular, color: AppColors.white);

  static const medium =
      TextStyle(fontFamily: AppFonts.robotoMedium, color: AppColors.white);
  static const italic =
      TextStyle(fontFamily: AppFonts.robotoItalic, color: AppColors.white);
}

class AppFonts {
  static const robotoRegular = 'RobotoRegular';
  static const robotoBold = 'RobotoBold';
  static const robotoMedium = 'RobotoMedium';
  static const robotoItalic = 'RobotoItalic';
}
