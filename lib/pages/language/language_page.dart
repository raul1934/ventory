import '../../shared/components/drawer.dart';
import '../../shared/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constaints.dart';
import 'language_controller.dart';

// ignore: must_be_immutable
class LanguagePage extends StatelessWidget {
  final _appController = Get.find<AppController>();
  final _languageController = Get.put(LanguageController());
  String val = "";

  LanguagePage({Key? key}) : super(key: key) {
    _languageController.loadlanguage();
    val = _languageController.language.value;
  }

  List<dynamic> languages = [
    {
      "color": const Color.fromRGBO(65, 144, 125, 1),
      "text": "Português",
      "abbreviation": "PT",
      "value": "pt-br",
    },
    {
      "color": const Color.fromRGBO(167, 221, 244, 1),
      "text": "Inglês",
      "abbreviation": "EN",
      "value": "eng",
    },
    {
      "color": const Color.fromRGBO(244, 69, 60, 1),
      "text": "Espanhol",
      "abbreviation": "ES",
      "value": "esp",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: primaryTextColor,
        centerTitle: true,
        title: const Text("Alterar a linguagem"),
        elevation: 1,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: ListView.separated(
            shrinkWrap: true,
            primary: true,
            itemCount: languages.length,
            itemBuilder: (BuildContext context, int index) =>
                buildListTile(context, index),
            separatorBuilder: (BuildContext context, int index) =>
                buildSeparator(context, index),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _appController.setLanguage(_languageController.language.value);
          Get.close(1);
        },
        child: const Icon(Icons.save, color: Colors.white),
        backgroundColor: primaryColor,
      ),
    );
  }

  Widget buildListTile(BuildContext context, int index) {
    return ListTile(
        title: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: languages[index]["color"],
                    border: Border.all(
                      color: languages[index]["color"],
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Text(
                  languages[index]["abbreviation"],
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              width: 15,
            ),
            Text(
              languages[index]["text"],
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
        leading: Obx(
          () => Transform.scale(
              scale: 1.3,
              child: Radio(
                focusColor: primaryColor,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                value: languages[index]["value"].toString(),
                groupValue: _languageController.language.value,
                onChanged: (value) {
                  _languageController.setLanguage(value.toString());
                },
                activeColor: Colors.green,
              )),
        ));
  }

  Widget buildSeparator(BuildContext context, int index) {
    return const SizedBox(
      height: 10,
    );
  }
}
