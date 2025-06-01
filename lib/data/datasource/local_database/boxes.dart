
import 'package:hive/hive.dart';
import 'package:inovola_task/data/models/expense/expense.dart';

class Boxes {
  late String expenseBox;

  Boxes() {
    expenseBox = "expenseBox" ;

  }

  Box<Expense> getExpenses() {
    return Hive.box<Expense>(expenseBox);
  }

  bool isExpenseBoxOpen() => Hive.isBoxOpen(expenseBox);

  openExpenseBox() async => Hive.openBox(expenseBox);



  closAllBoxes() {
    Hive.box<Expense>(expenseBox).compact() ;
    Hive.box<Expense>(expenseBox).deleteFromDisk();
    Hive.box<Expense>(expenseBox).close() ;
  }
}
