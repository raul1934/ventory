import '../../shared/components/primary_button.dart';

import '../../shared/components/drawer.dart';
import '../../shared/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constaints.dart';

class EntradasPage extends StatelessWidget {
  const EntradasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    AppController _controller = Get.find<AppController>();

    return Scaffold(
        drawer: DrawerComponent(
          selectedIndex: 1,
        ),
        appBar: AppBar(
          backgroundColor: primaryColor,
          foregroundColor: primaryTextColor,
          centerTitle: true,
          title: const Text("Ventory"),
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
                      "Inciar Recebimento",
                      style: h2stylePrimary,
                      textAlign: TextAlign.center,
                    ),
                  )),
              PrimaryButton(
                child: const Text("PELO CÓDIGO NF"),
                onPressed: () {},
              )
            ],
          ),
        ));
  }
}
