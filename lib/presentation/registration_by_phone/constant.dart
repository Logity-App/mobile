import 'package:flutter/material.dart';
import 'package:mobile/presentation/common/constant.dart';

var kOtpFieldFilledBackground = Color.fromRGBO(57, 56, 56, 1.0);
var kOtpFieldEmptyBackground = Color.fromRGBO(224, 224, 224, 1.0);
var kOtpFieldFilledDigit = Color.fromRGBO(224, 224, 224, 1.0);
var kOtpFieldEmptyDigit = Color.fromRGBO(57, 56, 56, 1.0);

var kRetrySendTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 18,
    letterSpacing: 0,
    color: Colors.white);

var kEnterSmsCodeTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w200,
  fontSize: 18,
  letterSpacing: 0,
  color: kOtpFieldEmptyDigit,
);

var kEnterNumberHelperTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w200,
  fontSize: 16,
  letterSpacing: 0,
  color: kOtpFieldEmptyDigit,
);

var kPlaceholderPhoneTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w200,
  fontSize: 22,
  letterSpacing: 0,
  color: kMainAcsentColor,
);
