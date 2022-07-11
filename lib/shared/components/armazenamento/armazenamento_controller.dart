import 'package:get/get.dart';
import 'package:ventory/shared/components/armazenamento/armazenamento_model.dart';
import 'package:ventory/shared/controllers/base_controller.dart';
import 'package:ventory/shared/services/armazenamento_service.dart';

import '../dialogs.dart';

class ArmazenamentoController extends BaseController {
  final ArmazenamentoService _armazenamentoService = ArmazenamentoService();

  final armazenamentoModel = <ArmazenamentoModel>[].obs;

  loadArmazenamentos() async {
    toggleLoading(true);

    var result = await _armazenamentoService.loadArmazenamento();

    toggleLoading(false);

    if (!result["error"]) {
      List<ArmazenamentoModel> retList = <ArmazenamentoModel>[];
      for (Map<String, dynamic> item in result["data"]) {
        retList.add(ArmazenamentoModel.fromJson(item));
      }
      armazenamentoModel(retList);
    } else {
      Get.closeAllSnackbars();
      Get.back();
      Dialogs.showResponseDialog(result["exception"]);
    }
  }

  addArmazenamento(String label, String companyDoc, int parentId) async {
    toggleLoading(true);

    var result = await _armazenamentoService.addArmazenamento(
        label, companyDoc, parentId);

    toggleLoading(false);
    if (!result["error"]) {
      if (result["message"] != null) {
        Dialogs.showErrorDialog("Houve um problema", result["message"]);
      }
    } else {
      Dialogs.showResponseDialog(result["exception"]);
    }
  }

  deleteArmazenamento(int id) async {
    toggleLoading(true);
    dynamic result = await _armazenamentoService.deleteArmazenamento(id);
    toggleLoading(false);

    if (!result["error"]) {
      if (result["message"] != null) {
        Dialogs.showErrorDialog("Houve um problema", result["message"]);
      }
    } else {
      Dialogs.showResponseDialog(result["exception"]);
    }
  }
}
