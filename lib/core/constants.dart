import 'package:flutter/material.dart';

import '../data/models/category/categories.dart';
import 'app_theme.dart';

const int pageSize = 10;


//status code
const success_code = 200;

// shared prefs keys
const appCurrentUserAuth = "APP_CURRENT_USER_AUTH";
const userEmail = "USER_EMAIL";
const userPassword = "USER_PASSWORD";
const isFirstLogin = "IS_FIRST_LOGIN";

var emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

var passwordRegex =
RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_~]).{8,}$');

var decimalRegex = RegExp(r'^[0-9]+.?[0-9]*');

List<Category> categories = [
  Category(
      id: 1,
      name: 'Groceries',
      icon: Icons.shopping_cart,
      backgroundColor: AppColors.iconBackgrounds['Groceries']!.withOpacity(0.5),
      iconColor:  AppColors.iconBackgrounds['Groceries']!
  ),
  Category(
      id: 2,
      name: 'Entertainment',
      icon: Icons.local_activity,
      backgroundColor: AppColors.iconBackgrounds['Entertainment']!.withOpacity(0.5),
      iconColor:  AppColors.iconBackgrounds['Entertainment']!
  ),
  Category(
      id: 3,
      name: 'Gas',
      icon: Icons.local_gas_station,
      backgroundColor: AppColors.iconBackgrounds['Gas']!.withOpacity(0.5),
      iconColor: AppColors.iconBackgrounds['Gas']!,
  ),
  Category(
      id: 4,
      name: 'Shopping',
      icon: Icons.shopping_bag,
      backgroundColor: AppColors.iconBackgrounds['Shopping']!.withOpacity(0.5),
      iconColor:  AppColors.iconBackgrounds['Shopping']!
  ),
  Category(
      id: 5,
      name: 'News Paper',
      icon: Icons.article,
      backgroundColor: AppColors.iconBackgrounds['News Paper']!.withOpacity(0.5),
      iconColor: AppColors.iconBackgrounds['News Paper']!
  ),
  Category(
      id: 6,
      name: 'Transport',
      icon: Icons.directions_car,
      backgroundColor: AppColors.iconBackgrounds['Transport']!.withOpacity(0.5),
      iconColor:  AppColors.iconBackgrounds['Transport']!
  ),
  Category(
      id: 7,
      name: 'Rent',
      icon: Icons.home,
      backgroundColor: AppColors.iconBackgrounds['Rent']!.withOpacity(0.3),
      iconColor:  AppColors.iconBackgrounds['Rent']!
  ),
];
