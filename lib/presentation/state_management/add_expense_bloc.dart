import 'package:bloc/bloc.dart';
import 'package:inovola_task/data/datasource/local_database/local_datasource.dart';
import 'package:inovola_task/data/models/expense/expense.dart';
import 'package:inovola_task/data/repository/expense_repo.dart';
import 'package:inovola_task/domain/usecase/add_new_expense_usecase.dart';
import 'package:inovola_task/presentation/state_management/general_bloc_state.dart';

import '../../data/datasource/remote/api_services.dart';
import '../../data/datasource/remote/base_api_service.dart';
import '../../data/models/Currency/CurrencyConverter.dart';
import '../../data/repository/currency_repo.dart';
import '../../domain/repository/base_currency_repo.dart';
import '../../domain/repository/base_expanse_repo.dart';
import '../../domain/usecase/get_currency.dart';

enum ExpanseBlocType { addExpanse, getCurrency }

class ExpanseBlocState {

  Currency currency;

  ExpanseBlocState(this.currency);
}

class ExpanseBlocEvent {
  ExpanseBlocType type;
  Expense? expense;

  ExpanseBlocEvent(this.type, {this.expense});
}

class AddExpanseBloc
    extends Bloc<ExpanseBlocEvent, GeneralBlocState<ExpanseBlocState>> {
  AddExpanseBloc() : super(GeneralBlocState());

  Currency? currency;

  Stream<GeneralBlocState<ExpanseBlocState>> mapEventToState(
      ExpanseBlocEvent event) async* {
    BaseApiService baseApiService = ApiServices();
    BaseCurrencyRepo baseCurrencyRepo = CurrencyRepo(baseApiService);
    try {
      yield GeneralBlocState(waiting: true);
      if (event.type == ExpanseBlocType.addExpanse) {
        BaseLocalDataSource baseLocalDataSource = LocalDateSource();
        BaseExpanseRepo baseExpanseRepo = ExpanseRepo(baseLocalDataSource);
        AddNewExpenseUseCase(baseExpanseRepo).execute(event.expense!);
      } else if (event.type == ExpanseBlocType.getCurrency) {
        currency = await GetCurrencyUseCase(baseCurrencyRepo).execute();
        yield GeneralBlocState(
            data: ExpanseBlocState(currency!),
            waiting: false,
            hasData: true);
      }

    } on Exception catch (e) {
      yield GeneralBlocState(error: e.toString(),
          waiting: false,
          hasError: true);
    }
  }
}
