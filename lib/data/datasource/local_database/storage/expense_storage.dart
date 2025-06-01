
import 'package:hive/hive.dart';
import 'package:inovola_task/data/models/expense/expense.dart';

import '../boxes.dart';
import '../stroge.dart';

class ExpanseStorageImpl extends Storage<Expense> {
  static ExpanseStorageImpl? _instance;
  Box<Expense> expanseBox = Boxes().getExpenses();

  static ExpanseStorageImpl getInstance() {
    _instance ??= ExpanseStorageImpl();
    return ExpanseStorageImpl();
  }

  @override
  save(Expense data) async {
    final expanseId = expanseBox.keys.isEmpty ? 0 : expanseBox.keys.last + 1;
    await expanseBox.put(expanseId , data);
  }

  @override
  get(String key) {
    return expanseBox.get(key);
  }

  @override
  List<Expense>? getAll() {
    return expanseBox.values.toList();
  }

  @override
  delete(String key) {
    expanseBox.delete(key);
  }

  List<Expense> getPaginatedExpenses(int page, int perPage) {
    final start = page * perPage;
    return expanseBox.values.toList().skip(start).take(perPage).toList();
  }

  Future<void> deleteAll() async {
    expanseBox.clear();
  }
}