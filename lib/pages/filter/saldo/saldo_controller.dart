import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_app/shared/components/armazenamento/armazenamento_input_selector_model.dart';
import 'package:base_app/shared/components/dialogs.dart';
import 'package:base_app/shared/components/products/armazenamento_input_selector_model.dart';
import 'package:base_app/shared/controllers/base_controller.dart';
import 'package:base_app/shared/mixins/loader_mixin.dart';
import 'package:base_app/shared/services/products_service.dart';
import 'package:base_app/shared/services/saldo_service.dart';
import 'models/saldo_filter_result.dart';
import 'models/storage_items_result.dart';

class SaldoController extends BaseController with LoaderMixin {
  final armazenamento = ArmazenamentoInputSelectorModel().obs;
  final produto = ProductInputSelectorModel(text: 'Todos', value: null).obs;
  final saldoFilterResult = SaldoFilterResult(success: false).obs;
  final storageItemsResult = StorageItemsResult(success: false).obs;
  final botaoAtivo = false.obs;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
  }

  setArmazenamento(ArmazenamentoInputSelectorModel _armazenamento) {
    armazenamento(_armazenamento);
    setProduto(ProductInputSelectorModel(text: 'Todos', value: null));
    botaoAtivo(true);
  }

  setProduto(ProductInputSelectorModel _productInputSelectorModel) {
    produto(_productInputSelectorModel);
    update(['SaldoFilterBuilder']);
  }

  loadProducts() async {
    loading(true);
    ProductService saldoService = ProductService();
    var result = await saldoService.loadProducts(armazenamento.value.id!);
    loading(false);

    if (!result["error"]) {
      storageItemsResult(StorageItemsResult.fromJson(result));

      if (!storageItemsResult.value.success) {
        Dialogs.showErrorDialog(
            "Houve um problema", saldoFilterResult.value.message.toString());
      }
    } else {
      Dialogs.showResponseDialog(result["exception"]);
    }

    update(['SaldoFilterBuilder']);
  }

  filtrar() async {
    loading(true);
    update(['SaldoListBuilder']);

    SaldoService saldoService = SaldoService();
    var result;
    if (produto.value.value != null) {
      result = await saldoService.filter(
          armazenamento.value.id!, produto.value.value.id);
    } else {
      result = await saldoService.filter(armazenamento.value.id!, 0);
    }
    loading(false);
    if (!result["error"]) {
      saldoFilterResult(SaldoFilterResult.fromJson(result));

      if (!saldoFilterResult.value.success) {
        Get.snackbar(
            "Houve um problema", saldoFilterResult.value.message.toString(),
            icon: const Icon(Icons.align_vertical_bottom, color: Colors.red),
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Dialogs.showResponseDialog(result["exception"]);
    }

    update(['SaldoListBuilder']);
  }
}
