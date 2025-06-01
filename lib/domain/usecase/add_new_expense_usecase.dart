import 'package:inovola_task/data/models/expense/expense.dart';
import 'package:inovola_task/domain/repository/base_expanse_repo.dart';

class AddNewExpenseUseCase{
  BaseExpanseRepo baseExpanseRepo;

  AddNewExpenseUseCase(this.baseExpanseRepo);

  execute (Expense expense){
    baseExpanseRepo.addExpanse(expense);
  }
}