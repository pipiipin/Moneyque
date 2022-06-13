class Project {
  final String id;
  final String name;
  final String author;
  final String desc;
  final String tag;
  final String avatar;

  const Project._(
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
