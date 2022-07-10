import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventory/pages/entradas/por_nota_fiscal/models/nota_fiscal_result.dart';
import 'package:ventory/shared/components/armazenamento/armazenamento_input_selector_model.dart';
import 'package:ventory/shared/controllers/base_controller.dart';
import 'package:ventory/shared/mixins/loader_mixin.dart';
import 'package:ventory/shared/models/receipt_request_model.dart';
import 'package:ventory/shared/models/receipt_response_model.dart';
import 'package:ventory/shared/services/entradas_por_nota_fiscal_service.dart';

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

    notaFiscalResult(NotaFiscalResult.fromJson(
        await _entradasPorNotaFiscalService.getInvoice(nota.value)));

    loading(false);

    if (notaFiscalResult.value.success) {
      pageController.animateToPage(1,
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    } else {
      Get.snackbar(
          "Houve um problema", notaFiscalResult.value.message.toString(),
          icon: const Icon(Icons.error_outline_outlined, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM);
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

    receiptResponse(ReceiptResponseModel.fromJson(
        await _entradasPorNotaFiscalService
            .receiptInvoice(receiptRequestModel)));

    loading(false);

    if (receiptResponse.value.success) {
      Get.back();
      Get.snackbar("Sucesso!", receiptResponse.value.message.toString(),
          icon: const Icon(Icons.check_circle_outlined, color: Colors.green),
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar(
          "Houve um problema", receiptResponse.value.message.toString(),
          icon: const Icon(Icons.error_outline_outlined, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
