import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_app/constaints.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loaderRx) {
    ever<bool>(loaderRx, (loading) async {
      if (loading) {
        await Get.dialog(
          WillPopScope(
              onWillPop: () async => false,
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    child: CircularProgressIndicator(),
                    height: 50.0,
                    width: 50.0,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Material(
                      type: MaterialType.transparency,
                      child: Text(
                        "Aguarde...",
                        style: TextStyle(color: primaryColor, fontSize: 18),
                      ))
                ],
              ))),
          barrierDismissible: false,
          useSafeArea: false,
        );
      } else {
        Get.back(canPop: false);
      }
    });
  }
}
