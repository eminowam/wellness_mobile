class FoodModel {
  late final int id;
  late final String name;
  late final String description;
  late final String image;
  late final String duration;
  late final double fat;
  late final double carbs;
  late final double protein;
  late final double calories;

  FoodModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json["name"],
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
    "image": image,
    "fat": fat,
    "carbs": carbs,
    "protein": protein,
    "description": description,
    "duration": duration,
    "audio": calories
  };
}