import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventory/shared/components/armazenamento/armazenamento.dart';
import 'package:ventory/shared/components/armazenamento/armazenamento_controller.dart';

import '../../../constaints.dart';
import 'armazenamento_input_selector_model.dart';

class ArmazenamentoInputSelectorComponent extends StatefulWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final Function(ArmazenamentoInputSelectorModel value) onChanged;
  final ArmazenamentoInputSelectorModel? value;

  ArmazenamentoInputSelectorComponent(
      {Key? key, required this.onChanged, required this.value})
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.value!.text != "") {
      widget._textEditingController.text = widget.value!.text.toString();
      widget._textEditingController.value =
          TextEditingValue(text: widget.value!.text.toString());
    }

    return TextFormField(
      controller: widget._textEditingController,
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
      ),
      validator: (value) =>
          value != "" ? null : "O armazenamento é obrigatório",
      cursorColor: textColor,
      style: const TextStyle(),
      textInputAction: TextInputAction.next,
      readOnly: true,
      onTap: () async {
        ArmazenamentoInputSelectorModel? ret =
            await Get.to(() => ArmazenamentoComponent(
                  selectable: true,
                  value: widget.value!.id != null ? widget.value!.id! : -1,
                ));
        if (ret != null) {
          setState(() {
            widget.onChanged.call(ret);
            widget._textEditingController.text = ret.text.toString();
            widget._textEditingController.value =
                TextEditingValue(text: ret.text.toString());
          });
        }
      },
    );
  }
}
