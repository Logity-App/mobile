// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    EnterPhoneRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EnterPhonePage(),
      );
    },
    EnterSmsCodeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EnterSmsCodePage(),
      );
    },
    FinishSignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FinishSignUpPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomePage(),
      );
    },
  };
}

/// generated route for
/// [EnterPhonePage]
class EnterPhoneRoute extends PageRouteInfo<void> {
  const EnterPhoneRoute({List<PageRouteInfo>? children})
      : super(
          EnterPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterPhoneRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EnterSmsCodePage]
class EnterSmsCodeRoute extends PageRouteInfo<void> {
  const EnterSmsCodeRoute({List<PageRouteInfo>? children})
      : super(
          EnterSmsCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterSmsCodeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FinishSignUpPage]
class FinishSignUpRoute extends PageRouteInfo<void> {
  const FinishSignUpRoute({List<PageRouteInfo>? children})
      : super(
          FinishSignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinishSignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
