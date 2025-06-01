import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inovola_task/data/models/expense/expense.dart';
import 'dart:io';

import '../../core/app_theme.dart';
import '../../core/constants.dart';
import '../../data/models/category/categories.dart';
import '../state_management/add_expense_bloc.dart';
import '../state_management/general_bloc_state.dart';
import '../widgets/CommonDropBox.dart';
import '../widgets/button.dart';
import '../widgets/date_picker.dart';
import '../widgets/text_filed.dart';

class AddExpensePage extends StatefulWidget {

  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  Category? selectedCategory = categories[0];
  String ? selectedCurrency ="USD";
  Expense? newExpense = Expense();
  var formKey = GlobalKey<FormState>();
  File? _image;
  var dateController = TextEditingController();
  bool error = false;
  late AddExpanseBloc addExpanseBloc;
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        newExpense?.receiptPath = pickedFile.path;
      });
    }
  }

  @override
  void initState() {
    addExpanseBloc =
        BlocProvider.of<AddExpanseBloc>(context);
    addExpanseBloc.add(ExpanseBlocEvent(
        ExpanseBlocType.getCurrency));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: const BackButton(),
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: BlocConsumer<AddExpanseBloc, GeneralBlocState<ExpanseBlocState>>(
          bloc: addExpanseBloc,
          builder: (context, state) {
            return !state.hasData || state.waiting
                ? const Center(
              child: CircularProgressIndicator(
                color:
                AppColors.primaryBlue,
              ),
            ): Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonDropBox(
                    title: "Categories",
                    items: categories,
                    onChange: (value) {
                      setState(() {
                        selectedCategory = value;
                        newExpense?.category = value.name;
                      });
                    },
                    itemSelected: selectedCategory,
                    error: error,
                  ),
                  CommonTextFiled(
                    keyBoardType: TextInputType.number,
                    isNumber: true,
                    decimal: true,
                    title: "Amount",
                    validator: (val) {
                      if (val?.isEmpty ?? true) {
                        return "Please enter amount";
                      }
                    },
                    onChange: (text) {
                      newExpense?.originalAmount = double.tryParse(text);
                    },
                  ),
                  if(state.data?.currency.rates!=null)
                  CommonDropBox(
                    title: "Currency",
                    items: state.data!.currency.rates!.toJson().keys.toList(),
                    onChange: (value) {
                      setState(() {
                        selectedCurrency = value;
                        newExpense?.currency = value;
                      });
                    },
                    itemSelected: selectedCurrency,
                    error: error,
                  ),
                  CommonDatePicker(
                    controller: dateController,
                    title: "Date",
                    date: newExpense?.date ?? DateTime.now(),
                    validator: (val) {
                      if (val?.isEmpty ?? true) {
                        return "Please Enter Date";
                      }
                    },
                    onChange: (val) {
                      setState(() {
                        newExpense?.date = val;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Attach Receipt",
                    style: AppTextStyles.bodyBold,
                  ),
                  const SizedBox(height: 8),
                  _image != null
                      ? Row(
                          children: [
                            CircleAvatar(
                                backgroundImage: FileImage(_image!), radius: 30),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: _pickImage,
                              child: const Text(
                                "Upload image",
                                style: AppTextStyles.bodyBold,
                              ),
                            )
                          ],
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: error
                                      ? AppColors.errorRed
                                      : AppColors.inputBorder)),
                          child: InkWell(
                            onTap: _pickImage,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Upload image",
                                    style: AppTextStyles.inputHint),
                                Icon(Icons.camera_alt_outlined),
                              ],
                            ),
                          ),
                        ),
                  const SizedBox(height: 24),
                  const Text(
                    "Categories",
                    style: AppTextStyles.bodyBold,
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: categories.map((category) {
                        return Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: category.backgroundColor,
                              radius: 28,
                              child: Icon(category.icon,
                                  color: category.iconColor //: Colors.black,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              category.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            )
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 32),
                  AppButton(
                      text: 'Save',
                      onPressed: () {
                        if (newExpense?.category == null) {
                          setState(() {
                            error = true;
                          });
                        }

                        final isValid = formKey.currentState!.validate();

                        if (!isValid) return;
                        formKey.currentState!.save();
                        newExpense!.usdAmount =
                                  (newExpense!.originalAmount! /
                                      state.data!.currency.rates!
                                          .toJson()["$selectedCurrency"]);

                              addExpanseBloc.add(ExpanseBlocEvent(
                            ExpanseBlocType.addExpanse,
                            expense: newExpense));
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        }, listener: ( context,  state) {  },
      ),
    );
  }
}
