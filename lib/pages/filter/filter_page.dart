import 'package:get/get.dart';
import 'package:base_app/pages/filter/movimentation/movimentation_page.dart';
import 'package:base_app/pages/filter/saldo/saldo_page.dart';

import '../../shared/components/drawer.dart';
import 'package:flutter/material.dart';

import '../../constaints.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: DrawerComponent(
          selectedIndex: 2,
        ),
        appBar: AppBar(
          backgroundColor: primaryColor,
          foregroundColor: primaryTextColor,
          centerTitle: true,
          title: const Text("base_app"),
          elevation: 1,
          actions: const [],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Primeiro selecione o filtro",
                        style: h2stylePrimary,
                        textAlign: TextAlign.center,
                      ),
                    )),
                const SizedBox(height: 20),
                SizedBox(
                    child: ElevatedButton(
                      onPressed: (() {
                        Get.to(() => const SaldoPage());
                      }),
                      child: const Text("SALDO"),
                    ),
                    width: size.width * 0.9),
                const SizedBox(height: 20),
                SizedBox(
                    child: ElevatedButton(
                      onPressed: (() {
                        Get.to(() => MovimentationPage());
                      }),
                      child: const Text("INVENTÁRIO"),
                    ),
                    width: size.width * 0.9),
              ],
            ))));
  }
}
