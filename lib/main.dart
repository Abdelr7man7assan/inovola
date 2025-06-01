import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:inovola_task/presentation/controller/add_expense_bloc.dart';
import 'package:inovola_task/presentation/screens/login.dart';

import 'data/models/expense/expense.dart';
import 'presentation/controller/dashboard_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseAdapter());

  await Hive.openBox<Expense>('expenseBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AddExpanseBloc>(
            create: (context) => AddExpanseBloc(),
          ),
          BlocProvider<DashboardBloc>(
            create: (context) => DashboardBloc(),
          ),

        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoginPage(),
        )) ;
  }
}

