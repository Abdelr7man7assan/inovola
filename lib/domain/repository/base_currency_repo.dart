import '../../data/models/Currency/CurrencyConverter.dart';
import '../../data/models/expense/expense.dart';

abstract class BaseCurrencyRepo {
  Future<Currency> getCurrency();
}