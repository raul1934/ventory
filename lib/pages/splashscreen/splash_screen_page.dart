import '../../pages/login/login_page.dart';
import '../../shared/components/logo.dart';
import '../../shared/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(),
              SizedBox(
                height: size.height * 0.2,
              ),
              PrimaryButton(
                child: const Text("Logar"),
                onPressed: () {
                  Get.to(() => LoginPage());
                },
              ),
            ],
          ),
        ));
  }
}
