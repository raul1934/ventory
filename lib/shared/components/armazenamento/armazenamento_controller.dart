import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ventury/shared/components/armazenamento/armazenamento_model.dart';
import 'package:ventury/shared/controllers/base_controller.dart';
import 'package:ventury/shared/services/armazenamento_service.dart';

import '../dialogs.dart';

class ArmazenamentoController extends BaseController {
  final ArmazenamentoService _armazenamentoService = ArmazenamentoService();

  final armazenamentoModel = <ArmazenamentoModel>[].obs;

  loadArmazenamentos() async {
    toggleLoading(true);

    var ret = await _armazenamentoService.loadArmazenamento();

    List<ArmazenamentoModel> retList = <ArmazenamentoModel>[];
    for (Map<String, dynamic> item in ret["data"]) {
      retList.add(ArmazenamentoModel.fromJson(item));
    }
    armazenamentoModel(retList);

    toggleLoading(false);
  }

  addArmazenamento(String label, String companyDoc, int parentId) async {
    toggleLoading(true);
    dynamic ret = await _armazenamentoService.addArmazenamento(
        label, companyDoc, parentId);

    if (ret["message"] != null) {
      Dialogs.showAlertDialog("Houve um problema", ret["message"]);
    }

    toggleLoading(false);
  }

  deleteArmazenamento(int id) async {
    toggleLoading(true);
    dynamic ret = await _armazenamentoService.deleteArmazenamento(id);
    if (ret["message"] != null) {
      Dialogs.showAlertDialog("Houve um problema", ret["message"]);
    }
    toggleLoading(false);
  }
}
