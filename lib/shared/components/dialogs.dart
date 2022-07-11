import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Dialogs {
  static void showSuccessDialog(String title, String message) {
    Get.snackbar(title, message,
        isDismissible: false,
        shouldIconPulse: true,
        backgroundColor: Colors.white,
        snackStyle: SnackStyle.FLOATING,
        icon: const Icon(Icons.check, color: Colors.green),
        snackPosition: SnackPosition.BOTTOM);
  }

  static showErrorDialog(String title, String message) {
    Get.snackbar(title, message,
        isDismissible: false,
        shouldIconPulse: true,
        backgroundColor: Colors.white,
        snackStyle: SnackStyle.FLOATING,
        icon: const Icon(Icons.error_outline_outlined, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM);
  }

  static showResponseDialog(dynamic e) {
    if (e.runtimeType == TimeoutException) {
      Get.snackbar("Houve um problema",
          "Houve um problema ao processar a requisição, provavelmente você está sem internet. Caso o problema continue entre em contato com o suporte.",
          isDismissible: false,
          shouldIconPulse: true,
          backgroundColor: Colors.white,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.wifi_off, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM);
    } else if (e.runtimeType == SocketException) {
      Get.snackbar("Houve um problema",
          "Houve um problema ao processar a requisição, provavelmente você está sem internet. Caso o problema continue entre em contato com o suporte.",
          isDismissible: false,
          shouldIconPulse: true,
          overlayBlur: 0,
          backgroundColor: Colors.white,
          icon: const Icon(Icons.wifi_off, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Houve um problema", e.toString(),
          isDismissible: false,
          shouldIconPulse: true,
          overlayBlur: 0,
          backgroundColor: Colors.white,
          icon: const Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
