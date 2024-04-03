import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common/ui/constant.dart';
import 'package:mobile/common/ui/flash_messages.dart';
import 'package:mobile/common/ui/widgets.dart';
import 'package:mobile/features/sing_up/bloc/sing_up_bloc.dart';
import 'package:mobile/features/sing_up/view/constant.dart';
import 'package:mobile/features/sing_up/view/helpers.dart';

class EnterPhonePage extends StatelessWidget {
  const EnterPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: ScaffoldWidget(),
    );
  }
}

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({
    super.key,
  });

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
      body: BodyContainerWidget(),
    );
  }
}

class BodyContainerWidget extends StatelessWidget {
  const BodyContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _phoneController = TextEditingController();

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        if (state is SignUpStateNextLoading) {
          return Center(child: CircularProgressIndicator(color: kButtonColor));
        }
        if (state is SignUpStateNextFailure) {
          _showFlashError(context, state.exceptionMessage);
        }

        return _EnterPhoneNumberForm(phoneController: _phoneController);
      },
    );
  }

  void _showFlashError(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(flashError(context, message));
    });
  }
}

class _EnterPhoneNumberForm extends StatelessWidget {
  const _EnterPhoneNumberForm({
    super.key,
    required TextEditingController phoneController,
  }) : _phoneController = phoneController;

  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kCommonPageMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _TitleWidget(),
          SizedBox(height: 46),
          _EnterPhoneWidget(
            controller: _phoneController,
          ),
          SizedBox(height: 16),
          _NextButtonWidget(
            controller: _phoneController,
          )
        ],
      ),
    );
  }
}

class _NextButtonWidget extends StatelessWidget {
  final TextEditingController controller;
  const _NextButtonWidget({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signUpBloc = BlocProvider.of<SignUpBloc>(context);
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
          onPressed: () =>
              {signUpBloc.add(SignUpEventNext(phone: controller.text))},
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
  final TextEditingController controller;

  const _EnterPhoneWidget({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signUpBloc = BlocProvider.of<SignUpBloc>(context);
    return BlocBuilder<SignUpBloc, SignUpState>(
      bloc: signUpBloc,
      builder: (context, state) {
        return Column(children: [
          Container(
            width: double.infinity,
            child: Text("Please, enter your phone number:",
                style: kEnterNumberHelperTextStyle, textAlign: TextAlign.left),
          ),
          _PhoneTextField(controller: controller)
        ]);
      },
    );
  }
}

class _PhoneTextField extends StatelessWidget {
  final TextEditingController controller;

  _PhoneTextField({
    required this.controller,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final signUpBloc = BlocProvider.of<SignUpBloc>(context);

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 60,
          child: TextField(
            controller: controller,
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
      },
    );
  }
}
