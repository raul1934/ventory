import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventory/shared/components/armazenamento/armazenamento_input_selector_model.dart';
import 'package:ventory/shared/components/products/armazenamento_input_selector_model.dart';
import 'package:ventory/shared/controllers/base_controller.dart';
import 'package:ventory/shared/mixins/loader_mixin.dart';
import 'package:ventory/shared/models/storage_items_result.dart';
import 'package:ventory/shared/services/movimentation_service.dart';
import 'package:ventory/shared/services/products_service.dart';
import 'models/movimentation_filter_result.dart';
import 'package:intl/intl.dart';

class MovimentionController extends BaseController with LoaderMixin {
  final armazenamento = ArmazenamentoInputSelectorModel().obs;
  final produto = ProductInputSelectorModel(text: '', value: null).obs;
  final movimentationFilterResult =
      MovimentationFilterResult(success: false, items: null).obs;
  final storageItemsResult = StorageItemsResult(success: false).obs;
  final botaoAtivo = false.obs;

  final dataInicial = DateTime.now().obs;
  TextEditingController dateInicialTextEdittingController =
      TextEditingController();
  final dataFinal = DateTime.now().obs;
  TextEditingController dateFinalTextEdittingController =
      TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    setDataInicial(DateTime.now());
    setDataFinal(DateTime.now());
  }

  setArmazenamento(ArmazenamentoInputSelectorModel _armazenamento) {
    armazenamento(_armazenamento);
    setProduto(ProductInputSelectorModel(text: 'Todos', value: null));
    botaoAtivo(true);
  }

  setProduto(ProductInputSelectorModel _productInputSelectorModel) {
    produto(_productInputSelectorModel);
    update(['MovimentationFilterBuilder']);
  }

  loadProducts() async {
    loading(true);
    ProductService saldoService = ProductService();
    var result = await saldoService.loadProducts(armazenamento.value.id!);

    storageItemsResult(StorageItemsResult.fromJson(result));

    if (!storageItemsResult.value.success) {
      Get.snackbar("Houve um problema",
          movimentationFilterResult.value.message.toString(),
          icon: const Icon(Icons.align_vertical_bottom, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM);
    }

    loading(false);
    update(['MovimentationFilterBuilder']);
  }

  setDataInicial(DateTime? date) {
    if (date != null) {
      String formattedDate = DateFormat("dd/MM/yyyy").format(date);
      dateInicialTextEdittingController.text = formattedDate;
      dataInicial(date);
    }
  }

  setDataFinal(DateTime? date) {
    if (date != null) {
      String formattedDate = DateFormat("dd/MM/yyyy").format(date);
      dateFinalTextEdittingController.text = formattedDate;
      dataFinal(date);
    }
  }

  filtrar() async {
    loading(true);
    update(['MovimentationListBuilder']);

    var data_ini = DateFormat("yyyy-MM-dd").format(dataInicial.value);
    var data_end = DateFormat("yyyy-MM-dd").format(dataFinal.value);

    MovimentationService saldoService = MovimentationService();
    var result;
    if (produto.value.value != null) {
      result = await saldoService.filter(
          armazenamento.value.id!, data_ini, data_end, produto.value.value.id);
    } else {
      result = await saldoService.filter(
          armazenamento.value.id!, data_ini, data_end, 0);
    }

    movimentationFilterResult(MovimentationFilterResult.fromJson(result));

    loading(false);
    update(['MovimentationListBuilder']);

    if (!movimentationFilterResult.value.success) {
      Get.snackbar("Houve um problema",
          movimentationFilterResult.value.message.toString(),
          icon: const Icon(Icons.align_vertical_bottom, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
