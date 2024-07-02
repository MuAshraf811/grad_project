class UserModel {
  final String firstName;
  final String lastName;
  final String? image;
  final String? bio;
  final String? birthDate;
  final String email;
  final String? user;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.bio,
    required this.birthDate,
    required this.email,
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> res) {
    return UserModel(
      firstName: res['first_name'],
      lastName: res['last_name'],
      email: res['email'],
      user: res['username'] ?? '',
      image: res['image'] ?? '',
      bio: res['bio'] ?? '',
      birthDate: res['date_of_birth'] ?? '',
    );
  }
}
