import 'package:flutter/material.dart';

import '../widgets/loading_button_widget.dart';

class AppStyle {
  static const Color red500 = Color(0xFFE62129);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blackReal = Color(0xFF0F1728);
  static const Color bluePrimary = Color(0xFF0083AF);
  static const Color blackGray = Color(0xFF475467);
  static const Color blackGray01 = Color(0xFF344054);
  static const Color blackPure = Color(0xFF101828);
  static const Color grayDark = Color(0xFF98A1B2);
  static const Color grayDarkMore = Color(0xFF667084);
  static const Color grayLight400 = Color(0xFF98A2B3);

  /*
  * Generator site
  * http://mcg.mbitson.com/
  * */

  static BorderRadius borderRadiusVerySmall() => BorderRadius.circular(4.0);
  static BorderRadius borderRadiusSmall() => BorderRadius.circular(8.0);
  static BorderRadius borderRadiusMedium() => BorderRadius.circular(20.0);

  static InputDecoration textInputDecorator(
          {String? hint,
          Widget? icon,
          Widget? iconSuffix,
          Color? enableBorderColor,
          Color? focusBorderColor,
          bool isEnable = true}) =>
      InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: hint,
          hintStyle: styleRegular(size: 14, textColor: grayDark),
          prefixIcon: icon != null
              ? Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(14),
                  child: icon,
                )
              : null,
          suffixIcon: iconSuffix != null
              ? SizedBox(
                  height: 40,
                  width: 40,
                  child: iconSuffix,
                )
              : null,
          filled: true,
          fillColor: isEnable ? Colors.white : Colors.grey.shade400,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadiusSmall(),
            borderSide:
                BorderSide(color: enableBorderColor ?? grayDark, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: borderRadiusSmall(),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadiusSmall(),
            borderSide:
                BorderSide(color: focusBorderColor ?? Colors.grey, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: borderRadiusSmall(),
            borderSide:
                BorderSide(color: focusBorderColor ?? Colors.red, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: borderRadiusSmall(),
            borderSide:
                BorderSide(color: focusBorderColor ?? Colors.red, width: 2),
          ));

  // static ThemeData themeLight() {
  //   final colorScheme =
  //       ColorScheme.fromSeed(seedColor: const Color(0xFF239FE7));
  //   return ThemeData.light().copyWith(
  //       colorScheme: colorScheme,
  //       textTheme: const TextTheme().apply(fontFamily: "Avenir"));
  // }

  static TextStyle styleLight(
      {Color textColor = Colors.black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w300);
  }

  static TextStyle styleRegular(
      {Color textColor = Colors.black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Avenir",
        fontWeight: FontWeight.normal);
  }

  static TextStyle styleMedium(
      {Color textColor = Colors.black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w500);
  }

  static TextStyle styleSemiBold(
      {Color textColor = Colors.black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w600);
  }

  static TextStyle styleBold(
      {Color textColor = Colors.black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w700);
  }

  static TextStyle styleExtraBold(
      {Color textColor = Colors.black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w800);
  }

  static Widget buttonPrimary(
      {double height = 40,
      required double width,
      double borderRadius = 8,
      required String title,
      bool hasLoading = false,
      required Function() onTap}) {
    return LoadingBtn(
      height: height,
      width: width,
      borderRadius: borderRadius,
      color: AppStyle.bluePrimary,
      loader: Container(
        padding: const EdgeInsets.all(10),
        width: 40,
        height: 40,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
      child: Text(
        title,
        style: AppStyle.styleRegular(textColor: Colors.white),
      ),
      onTap: (startLoading, stopLoading, btnState) async {
        if (hasLoading) {
          if (btnState == ButtonState.idle) {
            startLoading();
            // call your network api
            await onTap();
            stopLoading();
          }
        } else {
          await onTap();
        }
      },
    );
  }

  static Widget buttonSecondary(
      {double height = 40,
      required double width,
      double borderRadius = 8,
      required String title,
      bool hasLoading = false,
      required Function() onTap}) {
    return LoadingBtn(
      height: height,
      width: width,
      borderRadius: borderRadius,
      borderSide: const BorderSide(color: grayDark, width: 1),
      color: Colors.white,
      loader: Container(
        padding: const EdgeInsets.all(10),
        width: 40,
        height: 40,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
      child: Text(
        title,
        style: AppStyle.styleLight(textColor: AppStyle.blackGray01),
      ),
      onTap: (startLoading, stopLoading, btnState) async {
        if (hasLoading) {
          if (btnState == ButtonState.idle) {
            startLoading();
            // call your network api
            await onTap();
            stopLoading();
          }
        } else {
          await onTap();
        }
      },
    );
  }
}
