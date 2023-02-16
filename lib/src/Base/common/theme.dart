import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;
double defaultRadius = 10.0;

Color kPrimaryColor = const Color(0xFF6D57A1);
Color kBlackColor = const Color(0xFF2A2A2A);
Color kWhiteColor = const Color(0xffFFFFFF);
Color kGreyColor = const Color(0xff9698A9);
Color kGreenColor = const Color(0xFF2CD889);
Color kHaviyGreenColor = const Color(0xFF26CC80);
Color kBlueColor = const Color(0xffe3fcff);
Color kRedColor = const Color(0xFFFC1414);
Color kBackgroundColor = const Color(0xFFF8F8F8);
Color kInactiveColor = const Color(0xFFDBDBDB);
Color kTransparentColor = Colors.transparent;
Color kAvailableColor = const Color(0xffE0D9FF);
Color kUnavailableColor = const Color(0xffEBECF1);
Color kYellowColor = const Color(0xFFF39204);
TextStyle blackTextStyle = GoogleFonts.poppins(
  color: kBlackColor,
);
TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: kWhiteColor,
);
TextStyle greyTextStyle = GoogleFonts.poppins(
  color: kGreyColor,
);
TextStyle greenTextStyle = GoogleFonts.poppins(
  color: kGreenColor,
);
TextStyle redTextStyle = GoogleFonts.poppins(
  color: kRedColor,
);
TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: kPrimaryColor,
);

BottomNavigationBarThemeData bottomNavigationBarTheme =
    BottomNavigationBarThemeData(
  selectedItemColor: kYellowColor,
  unselectedItemColor: kPrimaryColor,
  showSelectedLabels: true,
  showUnselectedLabels: true,
  type: BottomNavigationBarType.fixed,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

ColorScheme kColorScheme = ColorScheme(
  primary: kPrimaryColor,
  primaryContainer: kBlackColor,
  secondary: kGreenColor,
  secondaryContainer: kGreenColor,
  surface: kBlackColor,
  background: kBackgroundColor,
  error: Colors.red,
  onPrimary: kPrimaryColor,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.light,
);
