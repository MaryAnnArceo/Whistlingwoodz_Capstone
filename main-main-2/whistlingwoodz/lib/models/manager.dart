import 'package:whistlingwoodz/models/user.dart';

// Manager entity - But this is not used in the app. (It hasn't developed due to the time issue.)
class Manager extends UserModel {
  Manager({
    required String uid,
    required String fullName,
    required String email,
  }) : super(uid: uid, fullName: fullName, email: email);

  @override
  toJson() {
    return {
      "uid": uid,
      "fullName": fullName,
      "email": email,
    };
  }
}
