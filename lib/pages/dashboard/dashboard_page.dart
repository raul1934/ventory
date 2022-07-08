import 'package:ventory/shared/components/armazenamento/armazenamento.dart';

import '../../shared/components/drawer.dart';
import '../../shared/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constaints.dart';
import '../language/language_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    AppController _controller = Get.find<AppController>();

    return Scaffold(
        drawer: DrawerComponent(
          selectedIndex: 0,
        ),
        appBar: AppBar(
          backgroundColor: primaryColor,
          foregroundColor: primaryTextColor,
          centerTitle: true,
          title: const Text("Ventory"),
          elevation: 1,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => LanguagePage());
                },
                icon: const Icon(Icons.translate)),
            IconButton(
                onPressed: () {
                  Get.to(() => ArmazenamentoComponent(
                        selectable: false,
                        value: -1,
                      ));
                },
                icon: const Icon(Icons.account_tree)),
          ],
        ),
        body: SingleChildScrollView(
          primary: false,
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Seja bem vindo(a) ao Venture o APP de gerenciamento de Produtos da Shield",
                      style: h2stylePrimary,
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
        ));
  }
}
