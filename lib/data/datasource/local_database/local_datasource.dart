import 'package:inovola_task/data/datasource/local_database/main_storges.dart';

import '../../models/expense/expense.dart';

abstract class BaseLocalDataSource{
  List<Expense> getExpanse(int pageNum, int pageSize);

  bool addExpanse(Expense expense);
}

class LocalDateSource implements BaseLocalDataSource{


  @override
  bool addExpanse(Expense expense) {
    expenseStorage.save(expense);
    return true;
  }

  @override
  List<Expense> getExpanse(int pageNum, int pageSize) {
    return expenseStorage.getPaginatedExpenses(pageNum, pageSize);

  }
}