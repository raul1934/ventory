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
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const MaterialColor ventury =
      MaterialColor(_venturyPrimaryValue, <int, Color>{
    50: Color(0xFFE4F6E9),
    100: Color(0xFFBCE8C9),
    200: Color(0xFF90D9A5),
    300: Color(0xFF64C981),
    400: Color(0xFF42BE66),
    500: Color(_venturyPrimaryValue),
    600: Color(0xFF1DAB44),
    700: Color(0xFF18A23B),
    800: Color(0xFF149933),
    900: Color(0xFF0B8A23),
  });
  static const int _venturyPrimaryValue = 0xFF21B24B;

  static const MaterialColor venturyAccent =
      MaterialColor(_venturyAccentValue, <int, Color>{
    100: Color(0xFFB9FFC4),
    200: Color(_venturyAccentValue),
    400: Color(0xFF53FF6D),
    700: Color(0xFF3AFF57),
  });
  static const int _venturyAccentValue = 0xFF86FF98;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: primaryColor));

    return GetMaterialApp(
        title: 'Ventury Plus',
        home: const SplashScreenPage(),
        initialBinding: AppBinding(),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeftWithFade,
        showSemanticsDebugger: false,
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
            primaryColor: ventury,
            colorScheme: const ColorScheme.light(primary: primaryColor),
            visualDensity: VisualDensity.adaptivePlatformDensity));
  }
}
