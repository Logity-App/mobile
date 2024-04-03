import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile/common/ui/constant.dart';
import 'package:mobile/features/welcome/view/constant.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: kCommonPageMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TitleWidget(),
            SizedBox(height: 40),
            _GetStartedButtonWidget(),
            SizedBox(height: 17),
            _IAlreadyHaveAccount(),
          ],
        ),
      ),
    );
  }
}

class _IAlreadyHaveAccount extends StatelessWidget {
  const _IAlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Text(
        'I already have an account',
        style: kHaveAnAccountTextStyle,
      ),
    );
  }
}

class _GetStartedButtonWidget extends StatelessWidget {
  const _GetStartedButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        constraints:
            const BoxConstraints(minWidth: 160, minHeight: 66, maxHeight: 66),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              backgroundColor: kButtonColor),
          onPressed: () => {},
          child: Text(
            'Get started!',
            style: kButtonTextStyle,
          ),
        ));
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Let's start\n logging your life!",
          style: kTitleTextStyle, textAlign: TextAlign.center),
    );
  }
}
