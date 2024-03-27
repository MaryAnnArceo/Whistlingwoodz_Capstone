import 'package:firebase_auth/firebase_auth.dart';

// ...

Future<void> registerWithEmailAndPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print(e.toString());
  }
}

Future<void> signInWithEmailAndPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print(e.toString());
  }
}

// Sign out
Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}



