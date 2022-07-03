import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Dialogs {
  static void showAlertDialog(String title, String text) {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        titlePadding: const EdgeInsets.symmetric(vertical: 15),
        title: title,
        radius: 8,
        content: RichText(
            text: TextSpan(
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(text: text),
          ],
        )),
        backgroundColor: Colors.white,
        barrierDismissible: false,
        confirm: TextButton(
            onPressed: () {
              Get.close(1);
            },
            child: const Text("Salvar")));
  }
}
