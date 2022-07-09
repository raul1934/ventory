import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../shared/services/net_service.dart';
import '../../constaints.dart';

class SaidaService {
  realizarSaida(int armazenamento, int itemId, String batch, String expiresAt,
      int amount, String patientCode) {
    var storage = GetStorage();
    var language = storage.read("language");

    String url = ASTRA_URL_API + "/outputs";

    Map<String, dynamic> data = {
      "storage_id": armazenamento.toString(),
      "item_id": itemId.toString(),
      "batch": batch,
      "expires_at": expiresAt,
      "amount": amount.toString(),
      "patient_code": patientCode,
      "lang": language
    };

    return NetService.post(url, data);
  }
}
