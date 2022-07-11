import 'package:get/get.dart';
import 'package:ventory/constaints.dart';
import 'package:ventory/shared/components/armazenamento/armazenamento_input_selector.dart';
import 'package:flutter/material.dart';
import 'package:ventory/shared/components/loader.dart';

import 'package:ventory/shared/components/products/armazenamento_input_selector.dart';
import 'package:ventory/shared/components/products/armazenamento_input_selector_model.dart';
import 'movimentation_controller.dart';

class MovimentationFilterPage extends StatelessWidget {
  const MovimentationFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovimentionController>(
        id: 'MovimentationFilterBuilder',
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
                title: const Text("Filtrar movimentação"),
                elevation: 1,
                automaticallyImplyLeading: true,
              ),
              body: SingleChildScrollView(
                  primary: false,
                  child: buildBody(_controller, items, context)),
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

  SingleChildScrollView buildBody(MovimentionController _controller,
      List<ProductInputSelectorModel> items, BuildContext context) {
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
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onTap: () async {
                    var ret = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2022, 1, 1),
                        initialDate: _controller.dataInicial.value,
                        lastDate: DateTime(2030, 12, 29));
                    _controller.setDataInicial(ret);
                    FocusScope.of(context).nextFocus();
                  },
                  controller: _controller.dateInicialTextEdittingController,
                  readOnly: true,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      labelText: 'Data Inicial'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onTap: () async {
                    var ret = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2022, 1, 1),
                        initialDate: _controller.dataInicial.value,
                        lastDate: DateTime(2030, 12, 29));
                    _controller.setDataFinal(ret);
                    FocusScope.of(context).nextFocus();
                  },
                  readOnly: true,
                  controller: _controller.dateFinalTextEdittingController,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      labelText: 'Data Final'),
                ),
              ],
            )));
  }
}
