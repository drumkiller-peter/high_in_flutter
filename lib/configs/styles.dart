import 'package:flutter/material.dart';
import 'package:high_in_flutter/configs/app_colors.dart';
import 'package:high_in_flutter/configs/utils.dart';

class Styles {
  //* YET TO WORK IN THIS COLOR MANAGEMENT
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      drawerTheme: Theme.of(context).drawerTheme.copyWith(
            backgroundColor:
                isDarkTheme ? AppColors.darkGreyBackGround : AppColors.white,
            elevation: 0,
          ),

      //Todo: Work on Primary Swatch Generator
      primarySwatch: isDarkTheme
          ? const MaterialColor(
              0xff191414,
              <int, Color>{
                50: Color(0xff191414), //10%
                100: Color(0xff191414), //20%
                200: Color(0xff191414), //30%
                300: Color(0xff191414), //40%
                400: Color(0xff191414), //50%
                500: Color(0xff191414), //60%
                600: Color(0xff191414), //70%
                700: Color(0xff191414), //80%
                800: Color(0xff191414), //90%
                900: Color(0xff191414), //100%
              },
            )
          : const MaterialColor(
              0xF7FFFFFF,
              <int, Color>{
                50: Color(0xF7FFFFFF), //10%
                100: Color(0xF7FFFFFF), //20%
                200: Color(0xF7FFFFFF), //30%
                300: Color(0xF7FFFFFF), //40%
                400: Color(0xF7FFFFFF), //50%
                500: Color(0xF7FFFFFF), //60%
                600: Color(0xF7FFFFFF), //70%
                700: Color(0xF7FFFFFF), //80%
                800: Color(0xF7FFFFFF), //90%
                900: Color(0xF7FFFFFF), //100%
              },
            ),
      scaffoldBackgroundColor: isDarkTheme ? AppColors.black : AppColors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.spotifyGreen),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.spotifyGreen),
      primaryColorDark: AppColors.black,
      primaryColorLight: AppColors.white,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      textTheme: TextTheme(
        headline2: appTextStyle.copyWith(
            color: isDarkTheme ? Colors.white : Colors.black),
        headline1: appTextStyle.copyWith(
            color: isDarkTheme ? Colors.white : Colors.black),
        headline6: appTextStyle.copyWith(
            color: isDarkTheme ? Colors.white : Colors.black),
        bodyText1: appTextStyle.copyWith(
            color: isDarkTheme ? Colors.white : Colors.black),
        bodyText2: appTextStyle.copyWith(
            color: isDarkTheme ? Colors.white : Colors.black),
        caption: appTextStyle.copyWith(
            color: isDarkTheme ? Colors.white : Colors.black),
      ),
      backgroundColor: isDarkTheme ? AppColors.black : AppColors.white,
      indicatorColor:
          isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
      hintColor:
          isDarkTheme ? const Color(0xff280C0B) : const Color(0xffEECED3),
      highlightColor:
          isDarkTheme ? const Color(0xff372901) : const Color(0xffFCE192),
      hoverColor:
          isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
      focusColor:
          isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      sliderTheme:
          SliderThemeData(overlayShape: SliderComponentShape.noOverlay),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
