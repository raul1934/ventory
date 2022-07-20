import 'package:base_app/pages/saidas/saida/saida_page.dart';

import '../../shared/components/drawer.dart';
import '../../shared/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constaints.dart';

class SaidasPage extends StatelessWidget {
  const SaidasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        drawer: DrawerComponent(
          selectedIndex: 3,
        ),
        appBar: AppBar(
          backgroundColor: primaryColor,
          foregroundColor: primaryTextColor,
          centerTitle: true,
          title: const Text("base_app"),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          primary: false,
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Saídas",
                      style: h2stylePrimary,
                      textAlign: TextAlign.center,
                    ),
                  )),
              SizedBox(
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => SaidaPage()),
                      child: const Text("Iniciar Saída")),
                  width: size.width * 0.9)
            ],
          ),
        ));
  }
}
