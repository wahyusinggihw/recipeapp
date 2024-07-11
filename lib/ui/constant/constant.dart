import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String appName = 'Recipe App';

int get year => DateTime.now().year;
String get appLegalese => '© $year Recipe App. All rights reserved.';

const String appDesc =
    'Recipe app is a simple app that helps you to find and save your favorite recipes. \ndeveloped by wsw.dev. \ngithub.com/wahyusinggihw.';

const Color primaryColor = Colors.orange;
const Color secondaryColor = Color(0xFFFFFFC1);
Color accentColor = Colors.orange[200]!;
const Color blackColor = Color(0xFF000000);
const Color whiteColor = Color(0xFFFFFFFF);
const Color greyColor = Color(0xFF9E9E9E);
const Color transparentColor = Color(0x00000000);

// MaterialColor primaryCustomSwatch = const MaterialColor(0xffFBBD1C, {
//   50: primaryColor,
//   100: primaryColor,
//   200: primaryColor,
//   300: primaryColor,
//   400: primaryColor,
//   500: primaryColor,
//   600: primaryColor,
//   700: primaryColor,
//   800: primaryColor,
//   900: primaryColor,
// });

// MaterialColor primaryCustomSwatchDark = const MaterialColor(0xffFBBD1C, {
//   50: blackColor,
//   100: blackColor,
//   200: blackColor,
//   300: blackColor,
//   400: blackColor,
//   500: blackColor,
//   600: blackColor,
//   700: blackColor,
//   800: blackColor,
//   900: blackColor,
// });

double get deviceWidth => ScreenUtil().screenWidth;
double get deviceHeight => ScreenUtil().screenHeight;

void setupScreenUtil(BuildContext context) {
  double baseWidth = MediaQuery.of(context).size.width;
  double baseHeight = MediaQuery.of(context).size.height;
  double defaultScreenUtilWidth = 1080;
  double defaultScreenUtilHeight = 1920;
  double iPadPro12InchWidth = 2048;
  double iPadPro12InchHeight = 2732;
  double designWidth = 0;
  double designHeight = 0;

  /// ipad 11-inch width: 834, height: 1194
  /// ipad 9-inch width: 768, height: 1024
  if (baseWidth >= 768) {
    designWidth = iPadPro12InchWidth;
  } else {
    designWidth = defaultScreenUtilWidth;
  }

  if (baseHeight >= 1024) {
    designHeight = iPadPro12InchHeight;
  } else {
    designHeight = defaultScreenUtilHeight;
  }

  ScreenUtil.init(
    context,
    designSize: Size(designWidth, designHeight),
  );
}

double setWidth(double width) => ScreenUtil().setWidth(width);
double setHeight(double height) => ScreenUtil().setHeight(height);

double setFontSize(double size) => size.sp;

TextStyle styleTitle = TextStyle(
  fontSize: setFontSize(36),
  color: blackColor,
  fontWeight: FontWeight.w700,
);

Widget verticalSpace(double height) => SizedBox(height: setHeight(height));
Widget horizontalSpace(double width) => SizedBox(width: setWidth(width));

BorderRadius defaultRadius = BorderRadius.circular(30);
