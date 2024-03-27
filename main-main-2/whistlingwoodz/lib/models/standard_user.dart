import 'package:whistlingwoodz/models/user.dart';

// Standard user entity
class StandardUser extends UserModel {
  final bool standardUser;

  StandardUser({
    required String uid,
    required String fullName,
    required String email,
    required this.standardUser,
    // Add additional fields as needed
  }) : super(
          uid: uid,
          fullName: fullName,
          email: email,
        );

  @override
  toJson() {
    return {
      "uid": uid,
      "fullName": fullName,
      "email": email,
      "isStandardUser": standardUser,
    };
  }
}
