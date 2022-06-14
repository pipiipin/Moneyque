class Project {
  final String id;
  String name;
  String author;
  String desc;
  String tag;
  String avatar;

  Project._(
    this.id,
    this.name,
    this.author,
    this.desc,
    this.tag,
    this.avatar,
  );

  factory Project.fromJson(Map json) {
    final id = json['_id'] as String;
    final name = json['name'] as String;
    final author = json['author'] as String;
    final desc = json['desc'] as String;
    final tag = json['tag'] as String;
    final avatar = json['avatar'] as String;
    return Project._(id, name, author, desc, tag, avatar);
  }
}
