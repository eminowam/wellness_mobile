class UserDataModel {
  final String name;
  final String id;
  final String password;
  final String email;
  final String refreshToken;
  final String image;
  final double weight;
  final double height;

  UserDataModel(
      this.weight,
      this.refreshToken,
      this.height,
      this.name,
      this.image, this.id, {
        required this.password,
        required this.email,
      });
}
