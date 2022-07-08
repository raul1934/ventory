import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventory/shared/components/armazenamento/armazenamento_input_selector_model.dart';
import 'package:ventory/shared/components/products/armazenamento_input_selector_model.dart';
import 'package:ventory/shared/controllers/base_controller.dart';
import 'package:ventory/shared/mixins/loader_mixin.dart';
import 'package:ventory/shared/models/storage_items_result.dart';
import 'package:ventory/shared/services/products_service.dart';
import 'package:intl/intl.dart';

class SaidaController extends BaseController with LoaderMixin {
  final armazenamento = ArmazenamentoInputSelectorModel().obs;
  final produto = ProductInputSelectorModel(text: '', value: null).obs;
  final storageItemsResult = StorageItemsResult(success: false).obs;
  final data = DateTime.now().obs;
  final dataTextEditingController =
      TextEditingController(text: DateTime.now().toString());

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
}
