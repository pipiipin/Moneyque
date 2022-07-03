import 'package:flutter/foundation.dart';

class Credit {
  final String id;
  String card;
  String name;
  String expiry;
  String cvc;

  Credit._(this.id, this.card, this.name, this.expiry, this.cvc);

  factory Credit.fromJson(Map json) {
    final id = json['_id'] as String;
    final card = json['card'] as String;
    final name = json['name'] as String;
    final expiry = json['expiry'] as String;
    final cvc = json['cvc'] as String;
    return Credit._(id, card, name, expiry, cvc);
  }
}
