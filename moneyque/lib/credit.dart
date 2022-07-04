class CreditCard {
  final String id;
  String num;
  String name;
  String expiry;
  String cvc;

  CreditCard._(this.id, this.num, this.name, this.expiry, this.cvc);

  factory CreditCard.fromJson(Map json) {
    final id = json['_id'] as String;
    final num = json['num'] as String;
    final name = json['name'] as String;
    final expiry = json['expiry'] as String;
    final cvc = json['cvc'] as String;
    return CreditCard._(id, num, name, expiry, cvc);
  }
}
