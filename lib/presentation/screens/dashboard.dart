import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:inovola_task/core/app_theme.dart';
import 'package:inovola_task/core/constants.dart';
import 'package:inovola_task/data/models/expense/expense.dart';
import 'package:inovola_task/presentation/state_management/dashboard_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/models/category/categories.dart';
import '../state_management/general_bloc_state.dart';
import '../widgets/expense_card.dart';
import '../widgets/filter_popup.dart';
import 'add_expense.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late DashboardBloc _dashboardBloc;
  DateTime? lastDateToShow;
  int pageNum = 0;
  List<Expense> expenses = [];

  @override
  void initState() {
    _dashboardBloc = BlocProvider.of<DashboardBloc>(context);
    _dashboardBloc.add(
        DashboardBlocEvent(DashboardBlocType.getExpanses, pageNum: pageNum));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: SizedBox(
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryBlue,
          shape: const CircleBorder(),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddExpensePage())).then((v) {
            // _dashboardBloc.add(
            //     DashboardBlocEvent(DashboardBlocType.getExpanses, pageNum: 0));
          }),
          child: const Icon(Icons.add, color: AppColors.lightGrey, size: 32),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      body: BlocConsumer<DashboardBloc, GeneralBlocState<DashboardBlocState>>(
          bloc: _dashboardBloc,
          builder: (context, state) {
            return !state.hasData || state.waiting
                ? const Center(
              child: CircularProgressIndicator(
                color:
                AppColors.primaryBlue,
              ),
            ): Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primaryBlue,
                        ),
                        child: SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    children: [
                                      // CircleAvatar(
                                      //   backgroundImage: AssetImage('assets/profile.jpg'),
                                      //   radius: 20,
                                      // ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Good Morning",
                                              style: TextStyle(
                                                  color: Colors.white70)),
                                          Text("Shihab Rahman",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ShowFilerPopup(
                                      onPressed: (filterValue) {
                                        setState(() {
                                          DateTime now = DateTime.now();
                                          switch (filterValue) {
                                            case FilterType.lastMonth:
                                              lastDateToShow = DateTime(
                                                  now.year,
                                                  now.month - 1,
                                                  now.day);
                                              break;
                                            case FilterType.lastWeek:
                                              lastDateToShow = DateTime(
                                                  now.year,
                                                  now.month,
                                                  now.day - 7);
                                              break;
                                            case FilterType.withoutFilters:
                                              lastDateToShow = null;
                                              break;
                                            default:
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              // const SizedBox(height: 124),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        left: 1,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.2,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.cardBlue,
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Balance ",
                                      style: TextStyle(color: Colors.white70)),
                                  Icon(Icons.more_horiz, color: Colors.white70),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text("\$ 2,548.00",
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("\u2193 Income",
                                          style:
                                              TextStyle(color: Colors.white70)),
                                      Text("\$ 10,840.00",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("\u2192 Expenses",
                                          style:
                                              TextStyle(color: Colors.white70)),
                                      Text("\$ 1,884.00",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Recent Expenses", style: AppTextStyles.bodyBold),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 390,
                  child: expenses.isEmpty
                      ? const Center(
                          child: Text(
                            "no Items Found",
                            style: AppTextStyles.titleLarge,
                          ),
                        )
                      : ListView.builder(
                          itemCount: expenses.length+1,
                          padding: EdgeInsets.only(bottom: 25),
                          itemBuilder: (context, index) {
                            if(index==expenses.length){
                            return(state.data?.expense?.length ?? 0) > 8?
                            Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    _dashboardBloc.add(DashboardBlocEvent(
                                        DashboardBlocType.getExpanses,
                                        pageNum:( state.data?.pageNum ?? 0) + 1));
                                  },
                                  child: const Text(
                                    "Load More",
                                    style: AppTextStyles.bodyBold,
                                  ),
                                )):Container();
                          }


                            final expense = expenses[index];
                            Category? cat = categories.lastWhere(
                              (category) => category.name == expense.category,
                            );
                            return expense.date?.isAfter(
                                        lastDateToShow ?? DateTime(2000)) ??
                                    true
                                ? ExpenseTile(
                                    icon: cat.icon,
                                    title: expense.category ?? "",
                                    usdAmount: expense.usdAmount!=null?
                                    double.parse(expense.usdAmount!.toStringAsFixed(2)):0.0,
                                    amount: expense.originalAmount??0.0,
                                    currency: expense.currency??"",
                                    time: expense.date != null
                                        ? DateFormat('yyyy-MM-dd')
                                            .format(expense.date!)
                                        : "",
                                    color: cat.iconColor,
                                  )
                                : Container();
                          },
                        ),
                ),

              ],
            );
          },
          listener: (context, state) {
            if (state.data?.expense?.isNotEmpty ?? false) {
              expenses.addAll(state.data?.expense ?? []);
            }
          }),
    );
  }
}
