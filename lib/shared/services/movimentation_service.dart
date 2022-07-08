import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../shared/services/net_service.dart';
import '../../constaints.dart';

class MovimentationService {
  filter(int armazenamento, int? itemId) {
    var storage = GetStorage();
    var language = storage.read("language");

    String url = ASTRA_URL_API + "/movement?storage_id=$armazenamento";
    if (itemId != 0) {
      url += "&item_id=$itemId";
    }

    url += "&lang=$language";

    return NetService.get(url);
  }
}
