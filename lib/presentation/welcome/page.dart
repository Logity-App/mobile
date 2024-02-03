import 'package:flutter/material.dart';
import 'package:mobile/presentation/common/constant.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(height: 313, width: double.infinity,),
          _TitleWidget(),
          SizedBox(height: 313, width: double.infinity,),
          // _GetStartedButtonWidget(),
        ],
      ),

    );
  }
}

// class _GetStartedButtonWidget extends StatelessWidget {
//   const _GetStartedButtonWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Let's start  logging your life!",
        style: kTitleTextStyle,
        textAlign: TextAlign.center
      ),
    );
  }
}