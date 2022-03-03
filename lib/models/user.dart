class User {
  String id;
  String imageUrl =
      'https://www.handiclubnimois.fr/wp-content/uploads/2020/10/blank-profile-picture-973460_1280.png';
  String firstName;
  String lastName;
  String email;
  int? age;
  int? weight = 0;
  int? height = 0;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.weight,
      this.height,
      this.age,
      required this.email,
      required this.imageUrl});
}
