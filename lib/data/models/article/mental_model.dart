class MeditationModel {
  late final int id;
  late final String title;
  late final String description;
  late final String image;
  late final String duration;
  late final String audio;

  MeditationModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json["title"],
        image = json["image"],
        description = json["description"],
        duration = json["duration"],
        audio = json["audio"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "description": description,
        "duration": duration,
        "audio": audio
      };
}
