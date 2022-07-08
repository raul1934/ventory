import 'package:get_storage/get_storage.dart';

import '../../shared/services/net_service.dart';
import '../../constaints.dart';

class ProductService {
  loadProducts(int armazenamento) {
    var storage = GetStorage();
    var language = storage.read("language");

    String url = ASTRA_URL_API +
        "/storage-items?storage_id=$armazenamento&lang=$language";

    return NetService.get(url);
  }
}
