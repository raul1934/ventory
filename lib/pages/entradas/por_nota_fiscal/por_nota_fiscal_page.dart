import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventory/constaints.dart';
import 'package:ventory/pages/entradas/por_nota_fiscal/por_nota_fiscal_controller.dart';
import 'package:ventory/shared/components/armazenamento/armazenamento_input_selector.dart';

import 'package:flutter/services.dart';
import 'package:ventory/shared/components/yes_no_component.dart';

class PorNotaFiscalPage extends StatelessWidget {
  PorNotaFiscalPage({Key? key}) : super(key: key);
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetX<PorNotaFiscalController>(
        tag: "EntradasPorNotaFiscalController",
        init: PorNotaFiscalController(),
        builder: (_controller) {
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller.pageController,
            allowImplicitScrolling: false,
            children: <Widget>[
              buildPrimeiraPagina(_controller),
              buildSegundaPagina(_controller, context),
              buildTerceiraPagina(_controller, context)
            ],
          );
        });
  }

  Scaffold buildPrimeiraPagina(PorNotaFiscalController _controller) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          foregroundColor: primaryTextColor,
          centerTitle: true,
          title: const Text("Nova Entrada"),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          primary: false,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
              child: Form(
                  key: _formKey1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ArmazenamentoInputSelectorComponent(
                            onChanged: (value) {
                              _controller.armazenamento(value);
                            },
                            value: _controller.armazenamento.value),
                        const SizedBox(height: 20),
                        TextFormField(
                            initialValue: _controller.nota.value,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (value) => value != ""
                                ? null
                                : "O Numero da nota fiscal é obrigatório",
                            decoration: const InputDecoration(
                                labelText: 'Número da NF'),
                            onChanged: (value) {
                              _controller.setNota(value);
                            }),
                      ]))),
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey1.currentState!.validate()) {
                    _controller.checkNota();
                  }
                },
                child: const Text("Avançar"))));
  }

  WillPopScope buildSegundaPagina(
      PorNotaFiscalController _controller, BuildContext context) {
    var remetenteText = "";
    var emitText = "";

    if (_controller.notaFiscalResult.value.invoice != null) {
      remetenteText =
          _controller.notaFiscalResult.value.invoice!.emit!.cNPJ.toString();
    }

    if (_controller.notaFiscalResult.value.invoice != null) {
      emitText =
          _controller.notaFiscalResult.value.invoice!.emit!.xNome.toString();
    }

    return WillPopScope(
        onWillPop: () {
          _controller.pageController.animateToPage(0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
          return Future.value(false);
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              foregroundColor: primaryTextColor,
              centerTitle: true,
              title: const Text("Nova Entrada"),
              elevation: 1,
            ),
            body: SingleChildScrollView(
              primary: false,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ArmazenamentoInputSelectorComponent(
                            onChanged: (value) {
                              _controller.armazenamento(value);
                            },
                            value: _controller.armazenamento.value),
                        const SizedBox(height: 15),
                        Text(
                          "Nota Fiscal: ",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                          textScaleFactor: 1.5,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _controller.nota.toString(),
                          textScaleFactor: 1.1,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Remetente:",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                          textScaleFactor: 1.5,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          remetenteText + " - " + emitText,
                          textScaleFactor: 1.1,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Items:",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                          textScaleFactor: 1.5,
                        ),
                        const SizedBox(height: 5),
                        ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) => ListTile(
                                title: Text(_controller.notaFiscalResult.value
                                        .invoice!.items![index].cEAN
                                        .toString() +
                                    " - " +
                                    _controller.notaFiscalResult.value.invoice!
                                        .items![index].xProd
                                        .toString() +
                                    " - " +
                                    _controller.notaFiscalResult.value.invoice!
                                        .items![index].qCom
                                        .toString()),
                              )),
                          itemCount:
                              _controller.notaFiscalResult.value.invoice != null
                                  ? _controller.notaFiscalResult.value.invoice!
                                      .items!.length
                                  : 0,
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider();
                          },
                        )
                      ])),
            ),
            bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                    onPressed: () {
                      _controller.pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: const Text("Avançar")))));
  }

  WillPopScope buildTerceiraPagina(
      PorNotaFiscalController _controller, BuildContext context) {
    var remetenteText = "";
    var emitText = "";

    if (_controller.notaFiscalResult.value.invoice != null) {
      remetenteText =
          _controller.notaFiscalResult.value.invoice!.emit!.cNPJ.toString();
    }

    if (_controller.notaFiscalResult.value.invoice != null) {
      emitText =
          _controller.notaFiscalResult.value.invoice!.emit!.xNome.toString();
    }

    return WillPopScope(
        onWillPop: () {
          _controller.pageController.animateToPage(1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
          return Future.value(false);
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              foregroundColor: primaryTextColor,
              centerTitle: true,
              title: const Text("Nova Entrada"),
              elevation: 1,
            ),
            body: SingleChildScrollView(
                primary: false,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                  child: Form(
                      key: _formKey2,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ArmazenamentoInputSelectorComponent(
                                onChanged: (value) {
                                  _controller.armazenamento(value);
                                },
                                value: _controller.armazenamento.value),
                            const SizedBox(height: 15),
                            Text(
                              "Nota Fiscal: ",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                              textScaleFactor: 1.5,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              _controller.nota.toString(),
                              textScaleFactor: 1.1,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Remetente:",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                              textScaleFactor: 1.5,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              remetenteText + " - " + emitText,
                              textScaleFactor: 1.1,
                            ),
                            const SizedBox(height: 30),
                            Text(
                              "Checklist Qualidade:",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                              textScaleFactor: 1.5,
                            ),
                            const SizedBox(height: 15),
                            YesNoComponent(
                              onChanged: (value) =>
                                  {_controller.setTemperaturaOK(value)},
                              value: false,
                              text: "Temperatura OK?",
                            ),
                            const SizedBox(height: 15),
                            YesNoComponent(
                              onChanged: (value) => {},
                              value: false,
                              text: "Embalagem OK?",
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                                initialValue: _controller.observacao.value,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                minLines: 1,
                                maxLines: 5,
                                validator: (value) =>
                                    value.toString().isNotEmpty
                                        ? null
                                        : "Informe uma observação",
                                decoration: const InputDecoration(
                                    labelText: 'Observação',
                                    hintText: "Informe aqui a observação"),
                                onChanged: (value) {
                                  _controller.setObservacao(value);
                                }),
                            const SizedBox(height: 15),
                            TextFormField(
                                initialValue:
                                    _controller.outrasInformacoes.value,
                                minLines: 1,
                                maxLines: 5,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                decoration: const InputDecoration(
                                    labelText: 'Outras Informações',
                                    hintText:
                                        "Informe aqui outras informações"),
                                onChanged: (value) {
                                  _controller.setOutrasInformacoes(value);
                                })
                          ])),
                )),
            bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey2.currentState!.validate()) {
                        _controller.showConfirm();
                      }
                    },
                    child: const Text("Confirmar")))));
  }
}
