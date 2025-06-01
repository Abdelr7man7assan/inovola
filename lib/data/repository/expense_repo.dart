import 'package:inovola_task/data/datasource/local_database/local_datasource.dart';
import 'package:inovola_task/data/models/Currency/CurrencyConverter.dart';
import 'package:inovola_task/data/models/expense/expense.dart';
import 'package:inovola_task/domain/repository/base_expanse_repo.dart';

class ExpanseRepo implements BaseExpanseRepo{
  BaseLocalDataSource baseLocalDateSource;

  ExpanseRepo(this.baseLocalDateSource);

  @override
  bool addExpanse(Expense expense)  {
     baseLocalDateSource.addExpanse(expense);
    return true;
  }

  @override
  List<Expense> getExpanseList(int pageNum, int pageSize) {
    return baseLocalDateSource.getExpanse(pageNum, pageSize);
  }




  
} 