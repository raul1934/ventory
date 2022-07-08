import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventory/shared/components/armazenamento/armazenamento_input_selector_model.dart';
import 'package:ventory/shared/components/products/armazenamento_input_selector_model.dart';
import 'package:ventory/shared/controllers/base_controller.dart';
import 'package:ventory/shared/mixins/loader_mixin.dart';
import 'package:ventory/shared/services/products_service.dart';
import 'package:ventory/shared/services/saldo_service.dart';
import 'models/saldo_filter_result.dart';
import 'models/storage_items_result.dart';

class SaldoController extends BaseController with LoaderMixin {
  final armazenamento = ArmazenamentoInputSelectorModel().obs;
  final produto = ProductInputSelectorModel(text: 'Todos', value: null).obs;
  final saldoFilterResult = SaldoFilterResult(success: false).obs;
  final storageItemsResult = StorageItemsResult(success: false).obs;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
  }

  setArmazenamento(ArmazenamentoInputSelectorModel _armazenamento) {
    armazenamento(_armazenamento);
    setProduto(ProductInputSelectorModel(text: 'Todos', value: null));
  }

  setProduto(ProductInputSelectorModel _productInputSelectorModel) {
    produto(_productInputSelectorModel);
    update(['SaldoFilterBuilder']);
  }

  loadProducts() async {
    loading(true);
    ProductService saldoService = ProductService();
    var result = await saldoService.loadProducts(armazenamento.value.id!);

    storageItemsResult(StorageItemsResult.fromJson(result));

    if (!storageItemsResult.value.success) {
      Get.snackbar(
          "Houve um problema", saldoFilterResult.value.message.toString(),
          icon: const Icon(Icons.align_vertical_bottom, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM);
    }

    loading(false);
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

    saldoFilterResult(SaldoFilterResult.fromJson(result));

    if (!saldoFilterResult.value.success) {
      Get.snackbar(
          "Houve um problema", saldoFilterResult.value.message.toString(),
          icon: const Icon(Icons.align_vertical_bottom, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM);
    }

    update(['SaldoListBuilder']);

    loading(false);
  }
}
