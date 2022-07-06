class User {
  final String id;
  String name;
  List<dynamic> tags;
  String avatar;
  String desc;

  User._(
    this.id,
    this.name,
    this.tags,
    this.avatar,
    this.desc,
  );

  factory User.fromJson(Map json) {
    final id = json['_id'] as String;
    final name = json['name'] as String;
    final tags = json['tags'] as List<dynamic>;
    final avatar = json['avatar'] as String;
    final desc = json['desc'] as String;
    return User._(id, name, tags, avatar, desc);
  }

  factory User.blank() {
    return User._('', '', [], '', '');
  }
}
