import 'package:flutter/material.dart';
import 'package:whistlingwoodz/utils/app_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whistlingwoodz/main.dart';
import 'package:whistlingwoodz/screens/auth.dart';

// This class for the appbar widget
class AppBarPage extends StatefulWidget implements PreferredSizeWidget {
  const AppBarPage({super.key, required this.data});
  final bool data;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  var loginStatus = FirebaseAuth.instance.authStateChanges();

  // Function for the icon button to connect with whistlingwoodz homepage
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://whistlingwoodz.com.au');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // This method is used to navigate to the landing page.
  homeFunction() {
    runApp(MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Whistlingwoodz',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      // ignore: prefer_const_constructors
      home: MyApp(selectedIndex: 7),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amberAccent, //withOpacity(0.50), // optional
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.home),
        // When it has clicked, it goes to the landing page.
        onPressed: homeFunction,
        color: appBackGroundColor,
      ),
      actions: [
        // Notification button
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: appBackGroundColor,
          ),
          onPressed: () {},
        ),
        // Open whistlingwoodz homepage
        IconButton(
          icon: const Icon(
            Icons.star,
            color: appBackGroundColor,
          ),
          // link to the whistlingwoodz homepage
          onPressed: () {
            _launchURL();
          },
        ),
        // Logout button: It goes to the WhistlingWoodz Landing page
        Visibility(
          visible: widget.data,
          replacement: IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: appBackGroundColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AuthScreen(error: false)),
              );
            },
          ),
          child: IconButton(
              icon: const Icon(
                Icons.logout_outlined,
                color: appBackGroundColor,
              ),
              // when it pressed the user is signed out
              onPressed: () => FirebaseAuth.instance.signOut()),
        ),
      ],
    );
  }
}
