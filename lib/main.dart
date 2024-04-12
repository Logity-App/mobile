import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/features/sing_up/api/abstract_sign_up_repository.dart';
import 'package:mobile/features/sing_up/service/service.dart';
import 'package:mobile/features/sing_up/storage/abstract_sign_up.dart';
import 'package:mobile/features/sing_up/storage/sign_up_storage.dart';
import 'package:mobile/router/router.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  initDependencies();
  runApp(const MyApp());
}

void initDependencies() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().info("Talker starting ...");

  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: true,
      ),
    ),
  );

  GetIt.I.registerLazySingleton<SignUpRepositoryContract>(
    () =>
        SignUpRepositoryContract(dio, baseUrl: dotenv.get('API_SSO_ENDPOINT')),
  );

  GetIt.I.registerLazySingleton<SignUpStorageContract>(
    () => SignUpStorage(),
  );

  GetIt.I.registerLazySingleton<SignUpService>(
    () => SignUpService(),
  );

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: true,
      printEventFullData: true,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Logity App',
        routerConfig: _appRouter.config(
            navigatorObservers: () => [
                  TalkerRouteObserver(GetIt.I<Talker>()),
                ]));
  }
}
