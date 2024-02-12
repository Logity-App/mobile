import 'package:flutter/material.dart';
import 'package:mobile/presentation/common/constant.dart';
import 'package:mobile/presentation/common/widgets.dart';
import 'package:mobile/presentation/registration_by_phone/constant.dart';

class EnterSmsCodePage extends StatelessWidget {
  const EnterSmsCodePage({super.key});

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
            SizedBox(height: 80),
            _EnterOtpWidget(),
            SizedBox(height: 20),
            _RetrySendOtpWidget(),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class _RetrySendOtpWidget extends StatelessWidget {
  const _RetrySendOtpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text("can be sent after 00:00",
          style: kEnterNumberHelperTextStyle, textAlign: TextAlign.left),
      _RetryButtonWidget()
    ]);
  }
}

class _RetryButtonWidget extends StatelessWidget {
  const _RetryButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 38,
        constraints: const BoxConstraints(minWidth: 57),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              backgroundColor: kButtonColor),
          onPressed: () => {},
          child: Text(
            'Send',
            style: kRetrySendTextStyle,
          ),
        ));
  }
}

class _EnterOtpWidget extends StatelessWidget {
  const _EnterOtpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        child: Text("Please, enter sms code:",
            style: kEnterSmsCodeTextStyle, textAlign: TextAlign.left),
      ),
      _OtpForm(),
    ]);
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
        Text("It is important for us that this number is real",
            style: kTitleTextStyle, textAlign: TextAlign.center),
      ],
    );
  }
}

class _OtpForm extends StatelessWidget {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _OtpInput(_fieldOne, true),
              _OtpInput(_fieldTwo, false),
              _OtpInput(_fieldThree, false),
              _OtpInput(_fieldFour, false),
            ],
          ),
        ],
      )),
    );
  }
}

class _OtpInput extends StatefulWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const _OtpInput(this.controller, this.autoFocus, {Key? key})
      : super(key: key);

  @override
  State<_OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<_OtpInput> {
  Color backgroundColor = kOtpFieldEmptyBackground;
  Color digitColor = kOtpFieldEmptyDigit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
      child: TextField(
        autofocus: widget.autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: widget.controller,
        maxLength: 1,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
          fontSize: 25,
          letterSpacing: 0,
          color: digitColor,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: "",
          fillColor: backgroundColor,
          filled: true,
        ),
        onChanged: (value) {
          if (value.length == 1) {
            backgroundColor = kOtpFieldFilledBackground;
            digitColor = kOtpFieldFilledDigit;
          } else {
            backgroundColor = kOtpFieldEmptyBackground;
            digitColor = kOtpFieldEmptyDigit;
          }
          setState(() {});
          FocusScope.of(context).nextFocus();
        },
      ),
    );
  }
}
