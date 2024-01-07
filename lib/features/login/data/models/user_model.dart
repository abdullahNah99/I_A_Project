final class UserModel {
  final int id;
  final String name;
  final String email;
  final String token;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData['id'],
      name: jsonData['name'],
      email: jsonData['email'],
      token: jsonData['token'],
    );
  }
}
