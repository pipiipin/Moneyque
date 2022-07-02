class Project {
  final String id;
  String name;
  String author;
  String desc;
  String tag;
  String price;
  bool isDonate;
  String image;
  bool isBought;

  Project._(this.id, this.name, this.author, this.desc, this.tag, this.price,
      this.isDonate, this.image, this.isBought);

  factory Project.fromJson(Map json) {
    final id = json['_id'] as String;
    final name = json['name'] as String;
    final author = json['author'] as String;
    final desc = json['desc'] as String;
    final tag = json['tag'] as String;
    final price = json['price'] as String;
    final isDonate = json['isDonate'] as bool;
    final image = json['image'] as String;
    final isBought = json['isBought'] as bool;
    return Project._(
        id, name, author, desc, tag, price, isDonate, image, isBought);
  }
}