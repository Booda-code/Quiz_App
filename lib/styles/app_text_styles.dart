import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle medium24({Color? color}) {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w500,
      fontSize: 24,
      color: color ?? Colors.white,
    );
  }

  static TextStyle medium18({Color? color}) {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: color ?? Colors.white,
    );
  }

  static TextStyle regular16({Color? color}) {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: color,
    );
  }

  static TextStyle regular12({Color? color}) {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: color ?? Colors.white,
    );
  }
}
