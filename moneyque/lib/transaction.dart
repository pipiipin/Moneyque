class Transaction {
  final String id;
  String owner;
  String project;
  double amount;

  Transaction._(
    this.id,
    this.owner,
    this.project,
    this.amount,
  );

  factory Transaction.fromJson(Map json) {
    final id = json['_id'] as String;
    final owner = json['owner'] as String;
    final project = json['project'] as String;
    final amount = json['amount'] as double;
    return Transaction._(id, owner, project, amount);
  }
}
