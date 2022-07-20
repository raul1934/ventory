import 'package:package_info_plus/package_info_plus.dart';
import 'package:base_app/pages/splashscreen/spash_screen_controller.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../pages/login/login_page.dart';
import '../../shared/components/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({Key? key}) : super(key: key);
  final _spashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);

    return GetBuilder<SplashScreenController>(
        id: 'SplashScreenBuilder',
        builder: (_controller) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Logo(),
                    const SizedBox(
                      height: 80,
                    ),
                    Obx(() => _spashScreenController.loading.value
                        ? SizedBox(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                            width: 50,
                            height: 50)
                        : SizedBox(
                            child: ElevatedButton(
                                onPressed: () {
                                  Get.to(() => LoginPage());
                                },
                                child: const Text("Logar")),
                            width: deviceInfo.size.width * 0.9)),
                    const SizedBox(
                      height: 60,
                    ),
                    FutureBuilder<PackageInfo>(
                      future: PackageInfo.fromPlatform(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.done:
                            var platformName = '';
                            if (kIsWeb) {
                              platformName = "Web";
                            } else {
                              if (Platform.isAndroid) {
                                platformName = "Android";
                              } else if (Platform.isIOS) {
                                platformName = "IOS";
                              } else if (Platform.isFuchsia) {
                                platformName = "Fuchsia";
                              } else if (Platform.isLinux) {
                                platformName = "Linux";
                              } else if (Platform.isMacOS) {
                                platformName = "MacOS";
                              } else if (Platform.isWindows) {
                                platformName = "Windows";
                              }
                            }

                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                '$platformName - Version: ${snapshot.data!.version}',
                              ),
                            );
                          default:
                            return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ));
        });
  }
}
