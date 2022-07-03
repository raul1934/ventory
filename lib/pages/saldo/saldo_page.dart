import 'package:ventury/shared/components/armazenamento/armazenamento_input_selector.dart';

import '../../shared/components/primary_button.dart';

import '../../shared/components/drawer.dart';
import '../../shared/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constaints.dart';

class SaldoPage extends StatelessWidget {
  const SaldoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            children: [ArmazenamentoInputSelectorComponent(selectable: true)],
          ),
        ));
  }
}
