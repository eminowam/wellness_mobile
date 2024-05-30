import 'package:flutter/cupertino.dart';
import 'package:wellness_mobile/configs/color.dart';

class AppStyle{
  static const signInTextStyle=TextStyle(color: Color(0xff1D1617),fontSize: 18,fontWeight: FontWeight.w400);
  static const signInTextStyleBold=TextStyle(color: Color(0xff1D1617),fontSize: 20,fontWeight: FontWeight.w600);

  static const editAuthStyle = TextStyle(
      fontSize: 14, color: Color(0xff78828A), fontWeight: FontWeight.w400);

  static const forgotPassword = TextStyle(
      color: bottomColor, fontSize: 12, fontWeight: FontWeight.w600);

  static const textAuthStyle = TextStyle(
      fontSize: 12, color: Color(0xff465058), fontWeight: FontWeight.w500);

  static const verifyCodeStyle = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w600);

  static const profileTextStyle = TextStyle(
      fontSize: 17, fontWeight: FontWeight.w500);

  static const editProfileText =
  TextStyle(fontSize: 15, fontWeight: FontWeight.w500);

}