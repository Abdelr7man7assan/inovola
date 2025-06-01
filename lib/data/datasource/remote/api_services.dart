
import 'package:inovola_task/data/models/Currency/CurrencyConverter.dart';

import 'api_client.dart';
import 'base_api_service.dart';

class ApiServices implements BaseApiService {
  @override
  Future<Currency> getCurrency() async {
     var response= await ServicesHandler.getServices(urlSuffix: "https://open.er-api.com/v6/latest/USD");

    return Currency.fromJson(response);
  }

}
