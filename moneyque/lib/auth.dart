class Auth {
  final String id;
  String username;
  String name;
  String lastname;
  String email;
  List<dynamic> tags;
  String password;

  Auth._(this.id, this.username, this.name, this.lastname, this.email,
      this.password, this.tags);

  factory Auth.fromJson(Map json) {
    final id = json['_id'] as String;
    final username = json['username'] as String;
    final name = json['name'] as String;
    final lastname = json['lastname'] as String;
    final email = json['email'] as String;
    final password = json['password'] as String;
    final tags = json['tags'] as List<dynamic>;
    return Auth._(id, username, name, lastname, email, password, tags);
  }
}
