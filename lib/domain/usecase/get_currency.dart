import 'package:inovola_task/data/models/Currency/CurrencyConverter.dart';
import 'package:inovola_task/data/models/expense/expense.dart';
import 'package:inovola_task/domain/repository/base_currency_repo.dart';
import 'package:inovola_task/domain/repository/base_expanse_repo.dart';

class GetCurrencyUseCase{
  BaseCurrencyRepo baseCurrencyRepo;

  GetCurrencyUseCase(this.baseCurrencyRepo);

  Future<Currency> execute () async {
    return await baseCurrencyRepo.getCurrency();
  }
}