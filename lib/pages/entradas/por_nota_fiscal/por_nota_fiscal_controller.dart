import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_app/pages/entradas/por_nota_fiscal/models/nota_fiscal_result.dart';
import 'package:base_app/shared/components/armazenamento/armazenamento_input_selector_model.dart';
import 'package:base_app/shared/components/dialogs.dart';
import 'package:base_app/shared/controllers/base_controller.dart';
import 'package:base_app/shared/mixins/loader_mixin.dart';
import 'package:base_app/shared/models/receipt_request_model.dart';
import 'package:base_app/shared/models/receipt_response_model.dart';
import 'package:base_app/shared/services/entradas_por_nota_fiscal_service.dart';

class PorNotaFiscalController extends BaseController with LoaderMixin {
  final armazenamento = ArmazenamentoInputSelectorModel().obs;
  final nota = "".obs;
  final PageController pageController =
      PageController(initialPage: 0, keepPage: false);
  final notaFiscalResult = NotaFiscalResult(success: false).obs;
  final observacao = "".obs;
  final outrasInformacoes = "".obs;
  final temperaturaOK = false.obs;
  final embalagemOK = false.obs;
  final receiptResponse = ReceiptResponseModel().obs;

  final EntradasPorNotaFiscalService _entradasPorNotaFiscalService =
      EntradasPorNotaFiscalService();

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
  }

  setArmazenamento(ArmazenamentoInputSelectorModel _armazenamento) {
    armazenamento(_armazenamento);
  }

  setNota(String _nota) {
    nota(_nota);
  }

  setObservacao(String _observacao) {
    observacao(_observacao);
  }

  setOutrasInformacoes(String _outrasInformacoes) {
    outrasInformacoes(_outrasInformacoes);
  }

  setTemperaturaOK(bool _temperaturaOK) {
    temperaturaOK(_temperaturaOK);
  }

  setembalagemOK(bool _embalagemOK) {
    embalagemOK(_embalagemOK);
  }

  checkNota() async {
    loading(true);
    var result = await _entradasPorNotaFiscalService.getInvoice(nota.value);
    loading(false);

    if (!result["error"]) {
      notaFiscalResult(NotaFiscalResult.fromJson(result));

      if (notaFiscalResult.value.success) {
        pageController.animateToPage(1,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        Dialogs.showErrorDialog(
            "Houve um problema", notaFiscalResult.value.message.toString());
      }
    } else {
      Dialogs.showResponseDialog(result["exception"]);
    }
  }

  showConfirm() async {
    var ret = await Get.defaultDialog(
      barrierDismissible: false,
      radius: 8.0,
      title: "Confirmação",
      middleText: 'Você confirma o recebimento com os valores selecionados?',
      confirm: ElevatedButton(
        onPressed: () {
          Get.back(result: true);
        },
        child: const Text(
          "Confirmar",
          style: TextStyle(fontSize: 16),
        ),
      ),
      cancel: TextButton(
        onPressed: () {
          Get.back(result: false);
        },
        child: Text(
          "Cancelar",
          style: TextStyle(color: Get.theme.primaryColor, fontSize: 16),
        ),
      ),
    );

    if (ret == true) {
      _receiptInvoice();
    }
  }

  _receiptInvoice() async {
    loading(true);

    ReceiptRequestModel receiptRequestModel = ReceiptRequestModel();

    receiptRequestModel.comments = observacao.value;
    receiptRequestModel.invoice = nota.value;
    receiptRequestModel.moreInfo = outrasInformacoes.value;
    receiptRequestModel.package = embalagemOK.value ? "yes" : "no";
    receiptRequestModel.temperature = temperaturaOK.value ? "yes" : "no";
    receiptRequestModel.storageId = armazenamento.value.id;
    receiptRequestModel.items = notaFiscalResult.value.invoice!.items!
        .map((e) => ReceiptRequestModelItem.fromJson(e.toJson()))
        .toList();

    var result =
        await _entradasPorNotaFiscalService.receiptInvoice(receiptRequestModel);
    if (!result["error"]) {
      receiptResponse(ReceiptResponseModel.fromJson(result));

      loading(false);

      if (receiptResponse.value.success) {
        Get.back();
        Dialogs.showSuccessDialog(
            "Sucesso!", receiptResponse.value.message.toString());
      } else {
        Dialogs.showErrorDialog(
            "Houve um problema", receiptResponse.value.message.toString());
      }
    } else {
      Dialogs.showResponseDialog(result["exception"]);
    }
  }
}
