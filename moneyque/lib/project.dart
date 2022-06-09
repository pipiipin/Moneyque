class Project {
  final String name;
  final String author;
  final String desc;
  final String tag;
  final String avatar;

  const Project._(
    this.name,
    this.author,
    this.desc,
    this.tag,
    this.avatar,
  );

  factory Project.fromJson(Map json) {
    final name = json['name'] as String;
    final author = json['author'] as String;
    final desc = json['desc'] as String;
    final tag = json['tag'] as String;
    final avatar = json['avatar'] as String;
    return Project._(name, author, desc, tag, avatar);
  }
}
