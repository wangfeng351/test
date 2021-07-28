import 'dart:ui';

import 'package:flutter_scaffold_demo/constant/color_constant.dart';
import 'package:flutter_scaffold_demo/constant/font_size_constant.dart';

class TextStyleConstant {
  // 白色不加粗
  static TextStyle font10Light() {
    return TextStyle(
        fontSize: FontSizeConstant.font20, color: ColorConstant.lightGrey);
  }

  static TextStyle font12Light() {
    return TextStyle(
        fontSize: FontSizeConstant.font24, color: ColorConstant.lightGrey);
  }

  static TextStyle font14Light() {
    return TextStyle(
        fontSize: FontSizeConstant.font28, color: ColorConstant.lightGrey);
  }

  static TextStyle font16Light() {
    return TextStyle(
        fontSize: FontSizeConstant.font32, color: ColorConstant.lightGrey);
  }

  static TextStyle font18Light() {
    return TextStyle(
        fontSize: FontSizeConstant.font36, color: ColorConstant.lightGrey);
  }

  static TextStyle font20Light() {
    return TextStyle(
        fontSize: FontSizeConstant.font40, color: ColorConstant.lightGrey);
  }

  static TextStyle font24Light() {
    return TextStyle(
        fontSize: FontSizeConstant.font48, color: ColorConstant.lightGrey);
  }

  static TextStyle font32Light() {
    return TextStyle(
        fontSize: FontSizeConstant.font64, color: ColorConstant.lightGrey);
  }

// 白色加粗
  static TextStyle font16LightBold() {
    return TextStyle(
      fontSize: FontSizeConstant.font32,
      color: ColorConstant.lightGrey,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle font18LightBold() {
    return TextStyle(
        fontSize: FontSizeConstant.font36,
        color: ColorConstant.lightGrey,
        fontWeight: FontWeight.bold);
  }

  static TextStyle font20LightBold() {
    return TextStyle(
        fontSize: FontSizeConstant.font40,
        color: ColorConstant.lightGrey,
        fontWeight: FontWeight.bold);
  }

  static TextStyle font24LightBold() {
    return TextStyle(
        fontSize: FontSizeConstant.font48,
        color: ColorConstant.lightGrey,
        fontWeight: FontWeight.bold);
  }

  static TextStyle font32LightBold() {
    return TextStyle(
        fontSize: FontSizeConstant.font64,
        color: ColorConstant.lightGrey,
        fontWeight: FontWeight.bold);
  }

// 黑色不加粗
  static TextStyle font10black() {
    return TextStyle(
        fontSize: FontSizeConstant.font20, color: ColorConstant.lightBlack);
  }

  static TextStyle font12black() {
    return TextStyle(
        fontSize: FontSizeConstant.font24, color: ColorConstant.lightBlack);
  }

  static TextStyle font14black() {
    return TextStyle(
        fontSize: FontSizeConstant.font28, color: ColorConstant.lightBlack);
  }

  static TextStyle font16black() {
    return TextStyle(
        fontSize: FontSizeConstant.font32, color: ColorConstant.lightBlack);
  }

  static TextStyle font18black() {
    return TextStyle(
        fontSize: FontSizeConstant.font36, color: ColorConstant.lightBlack);
  }

  static TextStyle font20black() {
    return TextStyle(
        fontSize: FontSizeConstant.font40, color: ColorConstant.lightBlack);
  }

  static TextStyle font24black() {
    return TextStyle(
        fontSize: FontSizeConstant.font48, color: ColorConstant.lightBlack);
  }

  static TextStyle font32black() {
    return TextStyle(
        fontSize: FontSizeConstant.font64, color: ColorConstant.lightBlack);
  }

  // 黑色加粗
  static TextStyle font16BlackBold() {
    return TextStyle(
      fontSize: FontSizeConstant.font32,
      color: ColorConstant.lightBlack,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle font18BlackBold() {
    return TextStyle(
        fontSize: FontSizeConstant.font36,
        color: ColorConstant.lightBlack,
        fontWeight: FontWeight.bold);
  }

  static TextStyle font20BlackBold() {
    return TextStyle(
        fontSize: FontSizeConstant.font40,
        color: ColorConstant.lightBlack,
        fontWeight: FontWeight.bold);
  }

  static TextStyle font24BlackBold() {
    return TextStyle(
        fontSize: FontSizeConstant.font48,
        color: ColorConstant.lightBlack,
        fontWeight: FontWeight.bold);
  }

  static TextStyle font32BlackBold() {
    return TextStyle(
        fontSize: FontSizeConstant.font64,
        color: ColorConstant.lightBlack,
        fontWeight: FontWeight.bold);
  }

  // 自定义文本样式
  static TextStyle customFont([Color? color, double? size, bool? isBold]) {
    return TextStyle(
        fontSize: (size == null) ? 14.0 : size,
        color: (color == null) ? ColorConstant.white : color,
        fontWeight: (isBold != null)
            ? isBold
                ? FontWeight.bold
                : FontWeight.normal
            : FontWeight.normal);
  }
}
