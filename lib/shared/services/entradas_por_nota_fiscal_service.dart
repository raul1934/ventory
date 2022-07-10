import 'package:get_storage/get_storage.dart';
import 'package:ventory/shared/models/receipt_request_model.dart';

import '../../shared/services/net_service.dart';
import '../../constaints.dart';

class EntradasPorNotaFiscalService {
  getInvoice(String invoice) {
    var storage = GetStorage();
    var language = storage.read("language");

    String url = SHIELD_SHIPS_API + "/invoices?invoice=$invoice&lang=$language";
    return NetService.get(url);
  }

  receiptInvoice(ReceiptRequestModel receiptRequestModel) {
    var storage = GetStorage();
    var language = storage.read("language");

    receiptRequestModel.lang = language;

    String url = ASTRA_URL_API + "/receipts";
    return NetService.post(url, receiptRequestModel.toJson());
  }
}
