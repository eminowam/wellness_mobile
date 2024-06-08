class ArticleModel {
  late final int id;
  late final String title;
  late final String description;
  late final String image;

  ArticleModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json["title"],
        image = json["image"],
        description = json["description"];

  Map<String, dynamic> toJson() =>
      {"id": id, "title": title, "image": image, "description": description};
}
