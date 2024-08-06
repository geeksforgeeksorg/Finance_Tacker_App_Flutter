import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transactions.dart';
import '../widgets/transaction_list.dart';
import 'add_transaction_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionsProvider = Provider.of<TransactionsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Tracker'),
      ),
      body: FutureBuilder(
        future: transactionsProvider.fetchAndSetTransactions(),
        builder: (ctx, snapshot) => transactionsProvider.transactions.isEmpty
            ? const Center(
                child: Text("No transactions!"),
              )
            : TransactionList(transactionsProvider.transactions),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddTransactionScreen.routeName);
        },
      ),
    );
  }
}
