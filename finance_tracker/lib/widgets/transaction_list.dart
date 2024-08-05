import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onLongPress: () {

          },
          child: Card(
            child: ListTile(
              title: Text(transactions[index].category),
              subtitle: Text(transactions[index].date.toString()),
              trailing: Text('\$${transactions[index].amount.toString()}'),
            ),
          ),
        );
      },
    );
  }
}
