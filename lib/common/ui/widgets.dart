import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/common/ui/constant.dart';

var LogoWidget = Container(
  margin: kCommonPageMargin,
  child: Text(
    'Lo',
    style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 41,
        fontWeight: FontWeight.bold,
        color: kMainAcsentColor),
  ),
);

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kCommonPageMargin,
      child: SvgPicture.asset(
        'assets/icons/back_arrow.svg',
        width: 25,
        height: 25,
      ),
    );
  }
}
