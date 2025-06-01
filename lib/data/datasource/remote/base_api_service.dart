

import 'package:inovola_task/data/models/Currency/CurrencyConverter.dart';

import '../../../core/response_handler.dart';

abstract class BaseApiService {
  //authentication
  Future<Currency> getCurrency();

}
