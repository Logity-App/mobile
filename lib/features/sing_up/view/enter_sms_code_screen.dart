import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/common/ui/constant.dart';
import 'package:mobile/common/ui/flash_messages.dart';
import 'package:mobile/common/ui/widgets.dart';
import 'package:mobile/features/sing_up/bloc/send_sms_code_bloc.dart';
import 'package:mobile/features/sing_up/bloc/send_sms_code_event.dart';
import 'package:mobile/features/sing_up/bloc/send_sms_code_state.dart';
import 'package:mobile/features/sing_up/view/constant.dart';
import 'package:mobile/router/router.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

@RoutePage()
class EnterSmsCodePage extends StatelessWidget {
  const EnterSmsCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendSmsCodeBloc(SendSmsCodeStateInitial()),
      child: _ScaffoldWidget(),
    );
  }
}

class _ScaffoldWidget extends StatelessWidget {
  const _ScaffoldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LogoWidget,
        leadingWidth: 85,
        actions: [
          _BackButtonWidget(),
        ],
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
      body: _BodyContainerWidget(),
    );
  }
}

class _BodyContainerWidget extends StatelessWidget {
  const _BodyContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendSmsCodeBloc, SendSmsCodeState>(
      builder: (context, state) {
        if (state is SendSmsCodeStateLoading) {
          return Center(child: CircularProgressIndicator(color: kButtonColor));
        }

        if (state is SendSmsCodeStateBack) {
          AutoRouter.of(context).push(WelcomeRoute());
        }

        if (state is SendSmsCodeStateNextFailure) {
          _showFlashError(context, state.exceptionMessage);
        }

        if (state is SendSmsCodeStateResendFailure) {
          _showFlashError(context, state.exceptionMessage);
        }

        return Container(
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
        );
      },
    );
  }

  void _showFlashError(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(flashError(context, message));
    });
  }
}

class _RetrySendOtpWidget extends StatelessWidget {
  const _RetrySendOtpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(TimerStateInitial()),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_TextRemain(), _RetryButtonWidget()]),
    );
  }
}

class _TextRemain extends StatelessWidget {
  const _TextRemain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        String duration = "--:--";
        if (state is TimerTickState) {
          duration = state.formatRemainSeconds;
        }
        return Text("can be sent after $duration",
            style: kEnterNumberHelperTextStyle, textAlign: TextAlign.left);
      },
    );
  }
}

class _RetryButtonWidget extends StatelessWidget {
  const _RetryButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<SendSmsCodeBloc>(context);

    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        bool isEnabled = false;
        if (state is TimerTimeoutState) {
          isEnabled = true;
        }

        if (state is TimerTickState) {
          isEnabled = false;
        }
        return Container(
            width: 150,
            height: 38,
            constraints: const BoxConstraints(minWidth: 57),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  backgroundColor:
                      isEnabled ? kButtonColor : kButtonTextTitleColor),
              onPressed: isEnabled
                  ? () => {_bloc.add(SendSmsCodeEventResend())}
                  : null,
              child: Text(
                'Resend',
                style: isEnabled
                    ? kRetrySendEnableTextStyle
                    : kRetrySendDisableTextStyle,
              ),
            ));
      },
    );
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

class _BackButtonWidget extends StatelessWidget {
  const _BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SendSmsCodeBloc>(context);
    return GestureDetector(
      onTap: () {
        bloc.add(SendSmsCodeEventBack());
      },
      child: Container(
        margin: kCommonPageMargin,
        child: SvgPicture.asset(
          'assets/icons/back_arrow.svg',
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}

class _OtpForm extends StatelessWidget {
  final OtpFieldController otpController = OtpFieldController();
  Color digitColor = kOtpFieldEmptyDigit;

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<SendSmsCodeBloc>(context);
    return BlocBuilder<SendSmsCodeBloc, SendSmsCodeState>(
      builder: (context, state) {
        return OTPTextField(
            controller: otpController,
            length: 5,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 9.0, bottom: 1.0),
            textFieldAlignment: MainAxisAlignment.spaceBetween,
            otpFieldStyle: OtpFieldStyle(
                backgroundColor: kOtpFieldEmptyBackground,
                borderColor: kOtpFieldEmptyBackground,
                focusBorderColor: kOtpFieldEmptyBackground,
                enabledBorderColor: kOtpFieldEmptyBackground,
                disabledBorderColor: kOtpFieldEmptyBackground),
            fieldWidth: 64,
            outlineBorderRadius: 0,
            fieldStyle: FieldStyle.box,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 25,
              letterSpacing: 0,
              color: digitColor,
            ),
            onChanged: (smsCode) {},
            onCompleted: (smsCode) {
              _bloc.add(SendSmsCodeEventNext(smsCode: smsCode));
            });
      },
    );
  }
}

// class _OtpEditingController {
//   final TextEditingController fieldOne;
//   final TextEditingController fieldTwo;
//   final TextEditingController fieldThree;
//   final TextEditingController fieldFour;
//   _OtpEditingController()
//       : fieldOne = TextEditingController(),
//         fieldTwo = TextEditingController(),
//         fieldThree = TextEditingController(),
//         fieldFour = TextEditingController();

//   String getOtpCode() {
//     return fieldOne.text + fieldTwo.text + fieldThree.text + fieldFour.text;
//   }
// }

// class _OtpForm extends StatelessWidget {
//   final _OtpEditingController controller;

//   _OtpForm() : controller = _OtpEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _OtpInput(controller, controller.fieldOne, true),
//               _OtpInput(controller, controller.fieldTwo, false),
//               _OtpInput(controller, controller.fieldThree, false),
//               _OtpInput(controller, controller.fieldFour, false),
//             ],
//           ),
//         ],
//       )),
//     );
//   }
// }

// class _OtpInput extends StatefulWidget {
//   final TextEditingController controller;
//   final _OtpEditingController otpController;
//   final bool autoFocus;
//   const _OtpInput(this.otpController, this.controller, this.autoFocus,
//       {Key? key})
//       : super(key: key);

//   @override
//   State<_OtpInput> createState() => _OtpInputState();
// }

// class _OtpInputState extends State<_OtpInput> {
//   Color backgroundColor = kOtpFieldEmptyBackground;
//   Color digitColor = kOtpFieldEmptyDigit;

//   @override
//   Widget build(BuildContext context) {
//     final _bloc = BlocProvider.of<SendSmsCodeBloc>(context);

//     return SizedBox(
//       height: 64,
//       width: 64,
//       child: TextField(
//         autofocus: widget.autoFocus,
//         textAlign: TextAlign.center,
//         keyboardType: TextInputType.number,
//         controller: widget.controller,
//         maxLength: 1,
//         style: TextStyle(
//           fontFamily: 'Inter',
//           fontWeight: FontWeight.bold,
//           fontSize: 25,
//           letterSpacing: 0,
//           color: digitColor,
//         ),
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           counterText: "",
//           fillColor: backgroundColor,
//           filled: true,
//         ),
//         onChanged: (value) {
//           if (value.length == 1) {
//             backgroundColor = kOtpFieldFilledBackground;
//             digitColor = kOtpFieldFilledDigit;
//           } else {
//             backgroundColor = kOtpFieldEmptyBackground;
//             digitColor = kOtpFieldEmptyDigit;
//           }
//           setState(() {});
//           FocusScope.of(context).nextFocus();
//           print(FocusScope.of(context).skipTraversal()
//           if (!FocusScope.of(context).canRequestFocus) {
//             _bloc.add(SendSmsCodeEventNext(
//                 smsCode: widget.otpController.getOtpCode()));
//           }
//         },
//       ),
//     );
//   }
// }
