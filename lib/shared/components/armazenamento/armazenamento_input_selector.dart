import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventury/shared/components/armazenamento/armazenamento.dart';
import 'package:ventury/shared/components/armazenamento/armazenamento_controller.dart';

import '../../../constaints.dart';

class ArmazenamentoInputSelectorComponent extends StatefulWidget {
  bool selectable;
  ArmazenamentoInputSelectorComponent({Key? key, required this.selectable})
      : super(key: key);

  @override
  State<ArmazenamentoInputSelectorComponent> createState() =>
      _ArmazenamentoInputSelectorComponentState();
}

class _ArmazenamentoInputSelectorComponentState
    extends State<ArmazenamentoInputSelectorComponent> {
  ArmazenamentoController armazenamentoController =
      Get.put(ArmazenamentoController());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
          labelStyle: TextStyle(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: textColor, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: textColor, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: textColor, width: 1.0),
          ),
          focusColor: textColor,
          fillColor: textColor,
          hintText: "Selecione o armazenamento",
          labelText: "Armazenamento",
          floatingLabelStyle: TextStyle(color: textColor),
          errorText: "O armazenamento é obrigatório"),
      cursorColor: textColor,
      style: const TextStyle(),
      textInputAction: TextInputAction.next,
      readOnly: true,
      onTap: () async {
        print("Tapped");
        var ret = await Get.to(ArmazenamentoComponent(
          selectable: widget.selectable,
        ));
      },
    );
  }
}
