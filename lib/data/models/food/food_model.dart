class FoodModel {
  late final int id;
  late final String name;
  late final String description;
  late final String price;
  late final String image;
  late final String duration;
  late final int fat;
  late final int carbs;
  late final int protein;
  late final int calories;

  FoodModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json["name"],
        price = json["price"],
        image = json["image"],
        fat = json["fat"],
        carbs = json["carbs"],
        protein = json["protein"],
        description = json["description"],
        duration = json["duration"],
        calories = json["calories"];

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": name,
    "price": price,
    "image": image,
    "fat": fat,
    "carbs": carbs,
    "protein": protein,
    "description": description,
    "duration": duration,
    "audio": calories
  };
}