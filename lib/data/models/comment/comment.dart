class CommentModel {
    String name;
    String email;
    String description;
    String phone;

  CommentModel.copyWith(CommentModel comment)
      : name = comment.name,
        email = comment.email,
        description = comment.description,
        phone = comment.phone;

  CommentModel({
    this.phone = '',
    this.name = '',
    this.email = "",
    this.description = "",
  });

  CommentModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json["email"],
        phone = json["phone"],
        description = json["description"];

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "description": description
      };
}
