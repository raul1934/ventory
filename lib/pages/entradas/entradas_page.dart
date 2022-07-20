import 'package:get/get.dart';
import 'package:base_app/pages/entradas/por_nota_fiscal/por_nota_fiscal_page.dart';
import 'package:flutter/material.dart';
import 'package:base_app/shared/components/drawer.dart';

import '../../constaints.dart';

class EntradasPage extends StatelessWidget {
  const EntradasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: DrawerComponent(
          selectedIndex: 1,
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
                      "Entradas",
                      style: h2stylePrimary,
                      textAlign: TextAlign.center,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: ElevatedButton(
                    child: const Text("PELO CÓDIGO NF"),
                    onPressed: () => Get.to(() => PorNotaFiscalPage()),
                  ))
            ],
          ),
        ));
  }
}
