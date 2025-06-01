import 'package:bloc/bloc.dart';
import 'package:inovola_task/data/datasource/local_database/local_datasource.dart';
import 'package:inovola_task/data/models/expense/expense.dart';
import 'package:inovola_task/data/repository/expense_repo.dart';
import 'package:inovola_task/presentation/state_management/general_bloc_state.dart';

import '../../core/constants.dart';
import '../../domain/repository/base_expanse_repo.dart';
import '../../domain/usecase/get_expenses_usecase.dart';

enum DashboardBlocType { getExpanses,  }

class DashboardBlocState {
  List<Expense>? expense;


  int? pageNum;

  DashboardBlocState(this.expense, this.pageNum,);
}

class DashboardBlocEvent {
  DashboardBlocType type;
  int? pageNum;

  DashboardBlocEvent(this.type, {this.pageNum});
}

class DashboardBloc
    extends Bloc<DashboardBlocEvent, GeneralBlocState<DashboardBlocState>> {
  DashboardBloc() : super(GeneralBlocState());

  List<Expense>? expenses;

  Stream<GeneralBlocState<DashboardBlocState>> mapEventToState(
      DashboardBlocEvent event) async* {
    BaseLocalDataSource baseLocalDataSource = LocalDateSource();
    BaseExpanseRepo baseExpanseRepo = ExpanseRepo(baseLocalDataSource);
    try {
      yield GeneralBlocState(
        waiting: true,
      );
      if (event.type == DashboardBlocType.getExpanses) {
        expenses = GetExpansesUseCase(baseExpanseRepo)
            .execute(event.pageNum!, pageSize);
      }

      yield GeneralBlocState(
          data: DashboardBlocState(expenses!, event.pageNum),
          waiting: false,
          hasData: true);
    } on Exception catch (e) {
      yield GeneralBlocState(
          data: DashboardBlocState(expenses, event.pageNum ),
          waiting: false,
          error: e.toString(),
          hasError: true);
    }
  }
}
