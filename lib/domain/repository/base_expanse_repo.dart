import '../../data/models/Currency/CurrencyConverter.dart';
import '../../data/models/expense/expense.dart';

abstract class BaseExpanseRepo {

  List<Expense> getExpanseList(int pageNum , int pageSize);

  bool addExpanse(Expense expense);
}