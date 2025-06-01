import 'package:hive/hive.dart';

part 'expense.g.dart'; // This must match the file name exactly

@HiveType(typeId: 0)
class Expense extends HiveObject {
  @HiveField(0)
  String? category;

  @HiveField(1)
  double? originalAmount;

  @HiveField(2)
  double? usdAmount;

  @HiveField(3)
  DateTime? date;

  @HiveField(4)
  String? currency;

  @HiveField(5)
  String? receiptPath;

  Expense({
    this.category,
    this.originalAmount,
    this.usdAmount,
    this.date,
    this.currency,
    this.receiptPath,
  });

  @override
  String toString() {
    return 'Expense{category: $category, originalAmount: $originalAmount, usdAmount: $usdAmount, date: $date, currency: $currency, receiptPath: $receiptPath}';
  }
}
