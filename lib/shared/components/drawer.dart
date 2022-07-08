import 'package:ventory/pages/filter/filter_page.dart';
import 'package:ventory/pages/saidas/saidas_page.dart';

import '../../pages/dashboard/dashboard_page.dart';

import '../../pages/entradas/entradas_page.dart';
import '../../pages/filter/movimentation/movimentation_page.dart';
import '../../pages/filter/saldo/saldo_page.dart';
import '../../pages/splashscreen/splash_screen_page.dart';
import '../../shared/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constaints.dart';

// ignore: must_be_immutable
class DrawerComponent extends StatelessWidget {
  DrawerComponent({Key? key, required this.selectedIndex}) : super(key: key);
  final AppController _controller = Get.find<AppController>();
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Obx(() => ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 80,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _controller.fullname.value,
                      style:
                          const TextStyle(color: textColorLigth, fontSize: 16),
                    ),
                  ])),
              ListTile(
                selected: selectedIndex == 0,
                selectedTileColor: primaryColor,
                leading: Icon(
                  Icons.dashboard,
                  color: selectedIndex == 0 ? primaryTextColor : textColorLigth,
                  size: 32,
                ),
                title: Text(
                  'Dashboard',
                  style: TextStyle(
                      color: selectedIndex == 0
                          ? primaryTextColor
                          : textColorLigth,
                      fontSize: 20),
                ),
                onTap: selectedIndex != 0
                    ? () => Get.off(() => const DashboardPage())
                    : null,
              ),
              ListTile(
                selected: selectedIndex == 1,
                selectedTileColor: primaryColor,
                leading: Icon(
                  Icons.archive,
                  color: selectedIndex == 1 ? primaryTextColor : textColorLigth,
                  size: 32,
                ),
                title: Text(
                  'Entradas',
                  style: TextStyle(
                      color: selectedIndex == 1
                          ? primaryTextColor
                          : textColorLigth,
                      fontSize: 20),
                ),
                onTap: selectedIndex != 1
                    ? () => Get.off(() => const EntradasPage())
                    : null,
              ),
              ListTile(
                selected: selectedIndex == 2,
                selectedTileColor: primaryColor,
                leading: Icon(
                  Icons.receipt,
                  color: selectedIndex == 2 ? primaryTextColor : textColorLigth,
                  size: 32,
                ),
                title: Text(
                  'Saldo',
                  style: TextStyle(
                      color: selectedIndex == 2
                          ? primaryTextColor
                          : textColorLigth,
                      fontSize: 20),
                ),
                onTap: selectedIndex != 2
                    ? () => Get.off(() => const FilterPage())
                    : null,
              ),
              ListTile(
                selected: selectedIndex == 3,
                selectedTileColor: primaryColor,
                leading: Icon(
                  Icons.unarchive,
                  color: selectedIndex == 3 ? primaryTextColor : textColorLigth,
                  size: 32,
                ),
                title: Text(
                  'Saídas',
                  style: TextStyle(
                      color: selectedIndex == 3
                          ? primaryTextColor
                          : textColorLigth,
                      fontSize: 20),
                ),
                onTap: selectedIndex != 3
                    ? () => Get.off(() => const SaidasPage())
                    : null,
              ),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                  color: textColorLigth,
                  size: 32,
                ),
                title: const Text(
                  'Sair',
                  style: TextStyle(color: textColorLigth, fontSize: 20),
                ),
                onTap: () {
                  Get.off(() => const SplashScreenPage());
                },
              )
            ],
          )),
    );
  }
}
