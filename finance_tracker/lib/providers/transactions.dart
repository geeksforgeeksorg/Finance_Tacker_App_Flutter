import 'package:flutter/foundation.dart';
import '../models/transaction.dart';
import '../helpers/db_helper.dart';

class TransactionsProvider with ChangeNotifier {
  List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  void addTransaction(String category, double amount, DateTime date) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      category: category,
      amount: amount,
      date: date,
    );
    _transactions.add(newTransaction);
    notifyListeners();
    DBHelper.insert('transactions', {
      'id': newTransaction.id,
      'category': newTransaction.category,
      'amount': newTransaction.amount,
      'date': newTransaction.date.toIso8601String(),
    });
  }

  Future<void> fetchAndSetTransactions() async {
    final dataList = await DBHelper.getData('transactions');

    _transactions = dataList
        .map(
          (item) => Transaction(
            id: item['id'],
            category: item['category'],
            amount: item['amount'],
            date: DateTime.parse(item['date']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
