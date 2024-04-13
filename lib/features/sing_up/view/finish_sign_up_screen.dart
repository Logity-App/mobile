import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/common/ui/constant.dart';
import 'package:mobile/common/ui/flash_messages.dart';
import 'package:mobile/common/ui/widgets.dart';
import 'package:mobile/features/sing_up/bloc/finish_sign_up_bloc.dart';
import 'package:mobile/features/sing_up/bloc/finish_sign_up_event.dart';
import 'package:mobile/features/sing_up/bloc/finish_sign_up_state.dart';
import 'package:mobile/features/sing_up/view/constant.dart';
import 'package:mobile/router/router.dart';

@RoutePage()
class FinishSignUpPage extends StatelessWidget {
  const FinishSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FinishBloc(),
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
      body: _BodyContainer(),
    );
  }
}

class _BodyContainer extends StatelessWidget {
  const _BodyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController birthDayController = TextEditingController();
    final TextEditingController defaultTagController = TextEditingController();
    return BlocBuilder<FinishBloc, FinishState>(
      builder: (context, state) {
        if (state is FinishRegisterLoadingState) {
          return Center(child: CircularProgressIndicator(color: kButtonColor));
        }

        if (state is FinishRegisterFailureState) {
          _showFlashError(context, state.errorMessage);
        }

        if (state is FinishRegisterSuccessState) {
          return Center(child: Text('success'));
        }

        if (state is FinishBackState) {
          AutoRouter.of(context).push(WelcomeRoute());
        }

        return Container(
          margin: kCommonPageMargin,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TitleWidget(),
              SizedBox(height: 54),
              _FormWidget(
                  birthDayController: birthDayController,
                  defaultTagController: defaultTagController),
              SizedBox(height: 20),
              _RegisterWidget(
                  birthDayController: birthDayController,
                  defaultTagController: defaultTagController),
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

class _RegisterWidget extends StatelessWidget {
  final TextEditingController birthDayController;
  final TextEditingController defaultTagController;

  const _RegisterWidget(
      {super.key,
      required this.birthDayController,
      required this.defaultTagController});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FinishBloc>(context);
    return GestureDetector(
      onTap: () {
        bloc.add(FinishRegisterEvent(
            defaultTag: defaultTagController.text,
            birthDay: birthDayController.text));
      },
      child: Container(
        height: 60,
        width: double.infinity,
        color: Color.fromRGBO(57, 56, 56, 1.0),
        child: Center(
          child: Text(
            'Register',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(224, 224, 224, 1),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 22,
              letterSpacing: 0,
            ),
          ),
        ),
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  final TextEditingController birthDayController;
  final TextEditingController defaultTagController;

  const _FormWidget(
      {super.key,
      required this.birthDayController,
      required this.defaultTagController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _EnterTextWidget(),
        _DefaultTagInputWidget(controller: defaultTagController),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
                child: _BirthDayInputWidget(controller: birthDayController)),
            SizedBox(width: 10),
            _CalendarWidget(),
          ],
        )
      ],
    );
  }
}

class _CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      color: Color.fromRGBO(57, 56, 56, 1.0),
      child: SizedBox(
          width: 20,
          height: 20,
          child: SvgPicture.asset('assets/icons/calendar.svg')),
    );
  }
}

class _EnterTextWidget extends StatelessWidget {
  const _EnterTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Please, enter your tag and birthday:',
        style: kEnterSmsCodeTextStyle, textAlign: TextAlign.start);
  }
}

class _DefaultTagInputWidget extends StatelessWidget {
  final TextEditingController controller;

  const _DefaultTagInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(224, 224, 224, 1.0),
      padding: EdgeInsets.only(left: 24),
      height: 60,
      child: TextField(
        controller: controller,
        style: kPlaceholderPhoneTextStyle,
        decoration: InputDecoration(
          hintText: 'Default tag',
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _BirthDayInputWidget extends StatelessWidget {
  final TextEditingController controller;

  const _BirthDayInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(224, 224, 224, 1.0),
      padding: EdgeInsets.only(left: 24),
      height: 60,
      child: TextField(
        controller: controller,
        style: kPlaceholderPhoneTextStyle,
        decoration: InputDecoration(
          hintText: 'Birth Day',
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'We need to know a little more about you',
      style: kTitleTextStyle,
      textAlign: TextAlign.center,
    );
  }
}

class _BackButtonWidget extends StatelessWidget {
  const _BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
