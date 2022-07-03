import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../shared/services/net_service.dart';
import '../../constaints.dart';

class ArmazenamentoService {
  loadArmazenamento() {
    var storage = GetStorage();
    var language = storage.read("language");

    String url = ASTRA_URL_API + "/storages?lang=$language";
    return NetService.get(url);
  }

  addArmazenamento(String label, String companyDoc, int parentId) {
    var storage = GetStorage();
    var language = storage.read("language");

    Map<String, String> data = {
      "label": label,
      "company_doc": companyDoc,
      "parent_id": parentId.toString(),
      "lang": language,
    };

    String url = ASTRA_URL_API + "/storages";
    return NetService.post(url, data);
  }

  deleteArmazenamento(int id) {
    var storage = GetStorage();
    var language = storage.read("language");

    String url = ASTRA_URL_API + "/storages/$id?lang=$language";
    return NetService.delete(url);
  }
}
