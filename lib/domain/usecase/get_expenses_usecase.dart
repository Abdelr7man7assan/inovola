import 'package:inovola_task/domain/repository/base_expanse_repo.dart';

import '../../data/models/expense/expense.dart';

class GetExpansesUseCase{
  BaseExpanseRepo expanseRepo;

  GetExpansesUseCase(this.expanseRepo);
  List<Expense> execute (int pageNum, int pageSize)  {
    print(1);
    return expanseRepo.getExpanseList(pageNum, pageSize);

  }
}