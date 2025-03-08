import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: AppColors.whiteColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryLight,
      unselectedItemColor: AppColors.whiteColor,
      selectedItemColor: AppColors.primaryDark,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: AppColors.whiteColor,
      shape: StadiumBorder(side: BorderSide(color: AppColors.whiteColor,width: 6))
    )
  );
  static final ThemeData darkTheme = ThemeData(
     appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.primaryLight,
    ),
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryDark,
      unselectedItemColor: AppColors.whiteColor,
      selectedItemColor: AppColors.primaryLight,
    ),
     floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.whiteColor
    )
  );
}
