import 'package:inovola_task/data/datasource/remote/base_api_service.dart';
import 'package:inovola_task/data/models/Currency/CurrencyConverter.dart';
import 'package:inovola_task/domain/repository/base_currency_repo.dart';

class CurrencyRepo implements BaseCurrencyRepo{
  BaseApiService baseApiService;

  CurrencyRepo(this.baseApiService);


  @override
  Future<Currency> getCurrency() async {
   return baseApiService.getCurrency();
  }


  
} 