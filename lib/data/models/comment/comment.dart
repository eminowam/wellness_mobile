class CommentModel {
  late final String name;
  late final String email;
  late final String description;
  late final String phone;

  CommentModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json["email"],
        phone = json["phone"],
        description = json["description"];

  Map<String, dynamic> toJson() =>
      {"name": name, "email": email, "phone": phone, "description": description};
}
