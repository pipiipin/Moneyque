import 'package:flutter/foundation.dart';

class Credit {
  final String id;
  String userId;
  String card;
  String name;
  String expiry;
  String cvc;

  Credit._(this.id,this.userId, this.card, this.name, this.expiry, this.cvc);

  factory Credit.fromJson(Map json) {
    final id = json['_id'] as String;
    final userId = json['userId'] as String;
    final card = json['card'] as String;
    final name = json['name'] as String;
    final expiry = json['expiry'] as String;
    final cvc = json['cvc'] as String;
    return Credit._(id ,userId, card, name, expiry, cvc);
  }
}
