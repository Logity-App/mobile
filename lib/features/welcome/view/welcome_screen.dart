import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common/ui/constant.dart';
import 'package:mobile/features/welcome/bloc/welcome_bloc.dart';
import 'package:mobile/features/welcome/bloc/welcome_event.dart';
import 'package:mobile/features/welcome/bloc/welcome_state.dart';
import 'package:mobile/features/welcome/view/constant.dart';
import 'package:mobile/router/router.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeBloc(),
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
    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        if (state is WelcomeStateGetStarted) {
          AutoRouter.of(context).push(EnterPhoneRoute());
        }

        if (state is WelcomeStateAlreadyHaveAccount) {}

        return Container(
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
        );
      },
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
    final bloc = BlocProvider.of<WelcomeBloc>(context);
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
          onPressed: () => {bloc.add(WelcomeEventGetStarted())},
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
