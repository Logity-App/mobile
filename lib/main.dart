import 'package:flutter/material.dart';
import 'package:mobile/presentation/registration_by_phone/enter_phone_page.dart';
import 'package:mobile/presentation/registration_by_phone/enter_sms_code_page.dart';
import 'package:mobile/presentation/welcome/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: EnterSmsCodePage());
  }
}
