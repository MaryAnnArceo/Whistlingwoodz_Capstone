// UserModel entity (Parent class of standard user and manager)
class UserModel {
  final String uid;
  final String fullName;
  final String email;

  const UserModel({
    required this.uid,
    required this.fullName,
    required this.email,
  });

  toJson() {
    return {
      "uid": uid,
      "fullName": fullName,
      "email": email,
    };
  }
}
