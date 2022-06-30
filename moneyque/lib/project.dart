class Project {
  final String id;
  String name;
  String author;
  String desc;
  String tag;
  String avatar;
  bool isDonate;
  String image;

  Project._(this.id, this.name, this.author, this.desc, this.tag, this.avatar,
      this.isDonate, this.image);

  factory Project.fromJson(Map json) {
    final id = json['_id'] as String;
    final name = json['name'] as String;
    final author = json['author'] as String;
    final desc = json['desc'] as String;
    final tag = json['tag'] as String;
    final avatar = json['avatar'] as String;
    final isDonate = json['isDonate'] as bool;
    final image = json['image'] as String;
    return Project._(id, name, author, desc, tag, avatar, isDonate, image);
  }
}
