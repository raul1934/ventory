import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventory/constaints.dart';
import 'package:ventory/pages/saidas/saida/saida_controller.dart';
import 'package:ventory/shared/components/armazenamento/armazenamento_input_selector.dart';

import 'package:ventory/shared/components/products/armazenamento_input_selector.dart';
import 'package:ventory/shared/components/products/armazenamento_input_selector_model.dart';

import 'package:flutter/services.dart';

class SaidaPage extends StatelessWidget {
  SaidaPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetX<SaidaController>(
        tag: "SaidaBuilder",
        init: SaidaController(),
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
                title: const Text("Saída"),
                elevation: 1,
              ),
              body: SingleChildScrollView(
                primary: false,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                    child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ArmazenamentoInputSelectorComponent(
                                  onChanged: (value) {
                                    _controller.armazenamento(value);
                                    _controller.loadProducts();
                                  },
                                  value: _controller.armazenamento.value),
                              const SizedBox(height: 20),
                              ProductInputSelectorComponent(
                                items: items,
                                onChanged: (ProductInputSelectorModel value) {
                                  _controller.produto(value);
                                },
                                value: _controller.produto.value,
                                acceptNull: false,
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: (value) => value != ""
                                      ? null
                                      : "O Lote é obrigatório",
                                  decoration:
                                      const InputDecoration(labelText: 'Lote'),
                                  onChanged: (value) {
                                    _controller.setLote(value);
                                  }),
                              const SizedBox(height: 20),
                              TextFormField(
                                onTap: () async {
                                  var ret = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(2022, 1, 1),
                                      initialDate: _controller.data.value,
                                      lastDate: DateTime(2030, 12, 29));
                                  FocusScope.of(context).nextFocus();
                                  _controller.setData(ret);
                                },
                                controller:
                                    _controller.dataTextEditingController,
                                readOnly: true,
                                decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.calendar_month),
                                    labelText: 'Vencimento'),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) => value != ""
                                    ? null
                                    : "A Quantidade é obrigatória",
                                decoration: const InputDecoration(
                                    labelText: 'Quantidade'),
                                onChanged: (value) {
                                  _controller.setQuantidade(value);
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) => value != ""
                                    ? null
                                    : "O Código do paciente é obrigatório",
                                decoration: const InputDecoration(
                                    labelText: 'Código do Paciente'),
                                onChanged: (value) {
                                  _controller.setCodPaciente(value);
                                },
                              )
                            ]))),
              ),
              bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _controller.showConfirm();
                        }
                      },
                      child: const Text("Avançar"))));
        });
  }
}
