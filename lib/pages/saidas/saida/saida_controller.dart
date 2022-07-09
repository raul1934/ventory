import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventory/pages/saidas/saida/models/saida_result.dart';
import 'package:ventory/shared/components/armazenamento/armazenamento_input_selector_model.dart';
import 'package:ventory/shared/components/products/armazenamento_input_selector_model.dart';
import 'package:ventory/shared/controllers/base_controller.dart';
import 'package:ventory/shared/mixins/loader_mixin.dart';
import 'package:ventory/shared/models/storage_items_result.dart';
import 'package:ventory/shared/services/products_service.dart';
import 'package:intl/intl.dart';

import 'package:ventory/shared/services/saidas_service.dart';

class SaidaController extends BaseController with LoaderMixin {
  final armazenamento = ArmazenamentoInputSelectorModel().obs;
  final produto = ProductInputSelectorModel(text: '', value: null).obs;
  final storageItemsResult = StorageItemsResult(success: false).obs;
  final data = DateTime.now().obs;
  final dataTextEditingController =
      TextEditingController(text: DateTime.now().toString());
  final quantidade = 0.obs;
  final codPaciente = 0.obs;
  final lote = 0.obs;
  final saidaResult = SaidaResult().obs;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    setData(DateTime.now());
  }

  setArmazenamento(ArmazenamentoInputSelectorModel _armazenamento) {
    armazenamento(_armazenamento);
    setProduto(ProductInputSelectorModel(text: '', value: null));
  }

  setQuantidade(String _quantidade) {
    quantidade(int.parse(_quantidade));
  }

  setCodPaciente(String _codPaciente) {
    codPaciente(int.parse(_codPaciente));
  }

  setLote(String _lote) {
    lote(int.parse(_lote));
  }

  setData(DateTime? date) {
    if (date != null) {
      String formattedDate = DateFormat("dd/MM/yyyy").format(date);
      dataTextEditingController.text = formattedDate;
      data(date);
    }
  }

  setProduto(ProductInputSelectorModel _productInputSelectorModel) {
    produto(_productInputSelectorModel);
    update(['SaidaBuilder']);
  }

  loadProducts() async {
    loading(true);
    update(['SaidaBuilder']);
    ProductService saldoService = ProductService();
    var result = await saldoService.loadProducts(armazenamento.value.id!);

    storageItemsResult(StorageItemsResult.fromJson(result));

    loading(false);
    update(['SaidaBuilder']);
  }

  fazerRetirada() async {
    loading(true);
    update(['SaidaBuilder']);
    SaidaService saidaService = SaidaService();
    var expires_at = DateFormat("yyyy-MM-dd").format(data.value);
    var result = await saidaService.realizarSaida(
        armazenamento.value.id!,
        produto.value.value.id,
        lote.value.toString(),
        expires_at,
        quantidade.value,
        codPaciente.value.toString());

    saidaResult(SaidaResult.fromJson(result));

    loading(false);
    update(['SaidaBuilder']);

    if (saidaResult.value.success) {
      Get.back();
      Get.snackbar("Sucesso!", saidaResult.value.message.toString(),
          icon: const Icon(Icons.check_circle_outlined, color: Colors.green),
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Houve um problema", saidaResult.value.message.toString(),
          icon: const Icon(Icons.error_outline_outlined, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  showConfirm() async {
    var ret = await Get.defaultDialog(
      barrierDismissible: false,
      radius: 8.0,
      title: "Confirmação",
      middleText: 'Você confirma a retirada com os valores selecionados?',
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
      fazerRetirada();
    }
  }
}
