import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/transactions.dart';
import './screens/home_screen.dart';
import './screens/add_transaction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => TransactionsProvider(),
      child: MaterialApp(
        title: 'Finance Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
        routes: {
          AddTransactionScreen.routeName: (ctx) => const AddTransactionScreen(),
        },
      ),
    );
  }
}
