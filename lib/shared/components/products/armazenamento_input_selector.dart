import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constaints.dart';
import '../primary_button.dart';
import 'armazenamento_input_selector_model.dart';

class ProductInputSelectorComponent extends StatefulWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final Function(ProductInputSelectorModel value) onChanged;
  final ProductInputSelectorModel? value;
  final List<ProductInputSelectorModel> items;
  final bool acceptNull;
  bool? required = false;
  String? text = "Selecione o armazenamento";

  ProductInputSelectorComponent(
      {Key? key,
      required this.onChanged,
      required this.items,
      required this.value,
      required this.acceptNull,
      this.required,
      this.text})
      : super(key: key);

  @override
  State<ProductInputSelectorComponent> createState() =>
      _ProductInputSelectorComponentState();
}

class _ProductInputSelectorComponentState
    extends State<ProductInputSelectorComponent> {
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
      decoration: InputDecoration(
        hintText: widget.text,
        labelText: "Produtos",
      ),
      enabled: widget.items.length > 1,
      textInputAction: TextInputAction.next,
      readOnly: true,
      validator: (value) => value != "" ? null : "O produto é obrigatório",
      onTap: () async {
        ProductInputSelectorModel? ret = await Get.to(() =>
            ProductListComponent(
                value: widget.value,
                items: widget.items,
                acceptNull: widget.acceptNull));
        if (ret != null) {
          setState(() {
            widget.onChanged.call(ret);
            widget._textEditingController.text = ret.text;
            widget._textEditingController.value =
                TextEditingValue(text: ret.text.toString());
            FocusScope.of(context).nextFocus();
          });
        } else {
          FocusScope.of(context).unfocus();
        }
      },
    );
  }
}

// ignore: must_be_immutable
class ProductListComponent extends StatefulWidget {
  late ProductInputSelectorModel? value;
  late bool acceptNull;
  List<ProductInputSelectorModel> items;
  ProductListComponent(
      {Key? key,
      required this.value,
      required this.items,
      required this.acceptNull})
      : super(key: key);

  @override
  State<ProductListComponent> createState() => _ProductListComponentState();
}

class _ProductListComponentState extends State<ProductListComponent> {
  dynamic _selectorModel;

  @override
  initState() {
    super.initState();
    if (widget.acceptNull == true) {
      widget.items = [
        ProductInputSelectorModel(text: "Todos", value: null),
        ...widget.items
      ];
    }

    _selectorModel = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Estrutura de Armazenamento"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                widget.items[index].text,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
              leading: Transform.scale(
                  scale: 1.3,
                  child: Radio(
                    focusColor: primaryColor,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    value: widget.items[index].text,
                    groupValue: _selectorModel.text,
                    onChanged: (dynamic value) {
                      setState(() {
                        _selectorModel = widget.items[index];
                      });
                    },
                    activeColor: Colors.green,
                  )),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(4.0),
          child: PrimaryButton(
              onPressed: () {
                Get.back(result: _selectorModel);
              },
              child: const Text("Selecionar"))),
    );
  }
}
