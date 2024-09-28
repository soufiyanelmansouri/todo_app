class UserModel {
  final String uid;
  final String email;
  final String? passwod;

  UserModel({
    required this.uid,
    required this.email,
    this.passwod,
  });
}
