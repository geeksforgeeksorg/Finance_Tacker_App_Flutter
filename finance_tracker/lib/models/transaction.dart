class Transaction {
  final String id;
  final String category;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
  });
}
