import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whistlingwoodz/screens/main_screen.dart';

// This is the main class of the app.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    navigatorKey: navigatorKey,
    debugShowCheckedModeBanner: false,
    title: 'Whistlingwoodz',
    theme: ThemeData(
      primarySwatch: Colors.amber,
    ),
    // landing page is the first screen when the app has started.
    home: const MyApp(selectedIndex: 7),
  ));
}

// the variable to save the global key
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.selectedIndex}) : super(key: key);
  final int selectedIndex;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int newIndex = 0;

  // This method saves the index whenever the bottom navigation bar is selected.
  void navigationTapped(int selectedIndex) {
    setState(() {
      newIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    navigationTapped(widget.selectedIndex);
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Use snapshots to save the screen as logged in if data is present, and as logged out if not.
        if (snapshot.hasData) {
          return MainScreen(data: true, selectedIndex: newIndex);
        } else {
          return MainScreen(data: false, selectedIndex: newIndex);
        }
      },
    );
  }
}
