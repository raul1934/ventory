import 'package:flutter_localizations/flutter_localizations.dart';

import '../../pages/dashboard/dashboard_page.dart';
import '../../pages/entradas/entradas_page.dart';
import '../../shared/controllers/app_binding.dart';
import '../../constaints.dart';
import '../../pages/login/login_page.dart';
import '../../pages/splashscreen/splash_screen_page.dart';

import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: primaryColor));
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const MaterialColor ventory =
      MaterialColor(_ventoryPrimaryValue, <int, Color>{
    50: Color(0xFFE7F5EE),
    100: Color(0xFFC3E7D5),
    200: Color(0xFF9BD7BA),
    300: Color(0xFF73C79E),
    400: Color(0xFF55BB89),
    500: Color(_ventoryPrimaryValue),
    600: Color(0xFF31A86C),
    700: Color(0xFF2A9F61),
    800: Color(0xFF239657),
    900: Color(0xFF168644),
  });
  static const int _ventoryPrimaryValue = 0xFF37AF74;

  static const MaterialColor ventoryAccent =
      MaterialColor(_ventoryAccentValue, <int, Color>{
    100: Color(0xFFBCFFD5),
    200: Color(_ventoryAccentValue),
    400: Color(0xFF56FF95),
    700: Color(0xFF3CFF86),
  });
  static const int _ventoryAccentValue = 0xFF89FFB5;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'ventory Plus',
        home: const SplashScreenPage(),
        initialBinding: AppBinding(),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeftWithFade,
        showSemanticsDebugger: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        getPages: [
          GetPage(
            name: '/',
            page: () => const SplashScreenPage(),
          ),
          GetPage(
            name: '/login',
            page: () => LoginPage(),
          ),
          GetPage(
            name: '/dashboard',
            page: () => const DashboardPage(),
          ),
          GetPage(
            name: '/entradas',
            page: () => const EntradasPage(),
          ),
        ],
        theme: ThemeData(
            primaryColor: ventory,
            colorScheme: const ColorScheme.light(primary: primaryColor),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: textColor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: textColor, width: 1.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: textColor, width: 1.0),
              ),
            )));
  }
}
