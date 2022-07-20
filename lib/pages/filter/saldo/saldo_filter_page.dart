import 'package:get/get.dart';
import 'package:base_app/constaints.dart';
import 'package:base_app/pages/filter/saldo/saldo_controller.dart';
import 'package:base_app/shared/components/armazenamento/armazenamento_input_selector.dart';
import 'package:flutter/material.dart';
import 'package:base_app/shared/components/loader.dart';

import 'package:base_app/shared/components/products/armazenamento_input_selector.dart';
import 'package:base_app/shared/components/products/armazenamento_input_selector_model.dart';

class SaldoFilterPage extends StatelessWidget {
  const SaldoFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaldoController>(
        id: 'SaldoFilterBuilder',
        builder: (_controller) {
          List<ProductInputSelectorModel> items = [];

          if (_controller.storageItemsResult.value.items != null) {
            items = _controller.storageItemsResult.value.items!
                .map((e) => ProductInputSelectorModel(
                    text: e.name.toString(), value: e))
                .toList();
          }

          return Scaffold(
              appBar: AppBar(
                backgroundColor: primaryColor,
                foregroundColor: primaryTextColor,
                centerTitle: true,
                title: const Text("Filtrar Saldo"),
                elevation: 1,
                automaticallyImplyLeading: true,
              ),
              body: SingleChildScrollView(
                  primary: false, child: buildBody(_controller, items)),
              bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                      onPressed: _controller.botaoAtivo.value
                          ? () {
                              Get.back();
                              _controller.filtrar();
                            }
                          : null,
                      child: const Text("filtrar"))));
        });
  }

  SingleChildScrollView buildBody(
      SaldoController _controller, List<ProductInputSelectorModel> items) {
    return SingleChildScrollView(
        primary: false,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ArmazenamentoInputSelectorComponent(
                    onChanged: (value) {
                      _controller.setArmazenamento(value);
                      _controller.loadProducts();
                    },
                    value: _controller.armazenamento.value),
                const SizedBox(height: 20),
                ProductInputSelectorComponent(
                  items: items,
                  onChanged: (ProductInputSelectorModel value) {
                    _controller.setProduto(value);
                  },
                  value: _controller.produto.value,
                  acceptNull: true,
                )
              ],
            )));
  }
}
