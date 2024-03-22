import 'package:flutter/material.dart';
import 'package:mobile/features/sing_up/view/constant.dart';
import 'package:mobile/features/sing_up/view/helpers.dart';
import 'package:mobile/presentation/common/constant.dart';
import 'package:mobile/presentation/common/widgets.dart';

class EnterPhonePage extends StatelessWidget {
  const EnterPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LogoWidget,
        leadingWidth: 85,
        actions: [BackButtonWidget()],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            margin: kCommonPageMargin,
            child: Divider(
              color: kButtonColor,
              height: 1.0,
            ),
          ),
        ),
      ),
      body: Container(
        margin: kCommonPageMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TitleWidget(),
            SizedBox(height: 46),
            _EnterPhoneWidget(),
            SizedBox(height: 16),
            _NextButtonWidget()
          ],
        ),
      ),
    );
  }
}

class _NextButtonWidget extends StatelessWidget {
  const _NextButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 60,
        constraints: const BoxConstraints(minWidth: 160),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              backgroundColor: kButtonColor),
          onPressed: () => {},
          child: Text(
            'Next',
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
    return Column(
      children: [
        Text("We are creating your\n account",
            style: kTitleTextStyle, textAlign: TextAlign.center),
      ],
    );
  }
}

class _EnterPhoneWidget extends StatelessWidget {
  const _EnterPhoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        child: Text("Please, enter your phone number:",
            style: kEnterNumberHelperTextStyle, textAlign: TextAlign.left),
      ),
      _PhoneTextField()
    ]);
  }
}

class _PhoneTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: TextField(
        keyboardType: TextInputType.phone,
        autocorrect: false,
        style: kPlaceholderPhoneTextStyle,
        inputFormatters: [RuPhoneInputFormatter()],
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: kButtonTextTitleColor,
          filled: true,
          hintText: "+7 (___) __ __",
        ),
      ),
    );
  }
}
