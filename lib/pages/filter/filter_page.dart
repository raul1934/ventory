import 'package:get/get.dart';
import 'package:ventory/pages/filter/movimentation/movimentation_page.dart';
import 'package:ventory/pages/filter/saldo/saldo_page.dart';
import 'package:ventory/shared/components/primary_button.dart';
import '../../shared/components/drawer.dart';
import 'package:flutter/material.dart';

import '../../constaints.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerComponent(
          selectedIndex: 2,
        ),
        appBar: AppBar(
          backgroundColor: primaryColor,
          foregroundColor: primaryTextColor,
          centerTitle: true,
          title: const Text("Ventory"),
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
                PrimaryButton(
                  onPressed: (() {
                    Get.to(() => const SaldoPage());
                  }),
                  child: const Text("SALDO"),
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  onPressed: (() {
                    Get.to(() => MovimentationPage());
                  }),
                  child: const Text("INVENTÁRIO"),
                ),
              ],
            ))));
  }
}
