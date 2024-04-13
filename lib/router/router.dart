import 'package:auto_route/auto_route.dart';
import 'package:mobile/features/sing_up/view/enter_phone_screen.dart';
import 'package:mobile/features/sing_up/view/enter_sms_code_screen.dart';
import 'package:mobile/features/sing_up/view/finish_sign_up_screen.dart';
import 'package:mobile/features/welcome/view/welcome_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: EnterPhoneRoute.page),
        AutoRoute(page: EnterSmsCodeRoute.page),
        AutoRoute(page: FinishSignUpRoute.page, path: '/')
      ];
}
