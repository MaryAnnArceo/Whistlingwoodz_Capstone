// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whistlingwoodz/screens/landing_page_screen.dart';
import 'package:whistlingwoodz/screens/match_making_screen.dart';
import 'package:whistlingwoodz/widgets/app_bar_widget.dart';
import 'package:whistlingwoodz/widgets/bottom_navigation_bar_widget.dart';
import 'package:whistlingwoodz/screens/wedding_celebrations_screen.dart';
import 'package:whistlingwoodz/screens/corporate_events_screen.dart';
import 'package:whistlingwoodz/screens/parties_screen.dart';
import 'package:whistlingwoodz/screens/services_screen.dart';
import 'package:whistlingwoodz/screens/survey_form_screen.dart';
import 'package:whistlingwoodz/screens/photo_gallery_screen.dart';
import 'package:whistlingwoodz/screens/inquiry_form_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whistlingwoodz/screens/admin/admin_screen.dart';

// This class is for navigating the user to the respective page based on the index.
class MainScreen extends StatefulWidget {
  const MainScreen(
      {super.key, required this.data, required this.selectedIndex});
  final bool data;
  final int selectedIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<String> docIDs = [];

  // Loading initial data with initState
  @override
  void initState() {
    super.initState();
    // Fetch all the document IDs from the users collection
    _fetchDocIds();
  }

  // Fetch all the document IDs from the users collection
  Future<void> _fetchDocIds() async {
    QuerySnapshot querySnapshot = await _firestore.collection('users').get();
    docIDs = querySnapshot.docs.map((doc) => doc.id).toList();
    setState(() {});
  }

  // Check if the current user is an admin
  Future<bool> _isAdmin() async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      return false;
    }
    for (var index = 0; index < docIDs.length; index++) {
      DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(docIDs[index]).get();
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        String userData = data['uid'];
        if (currentUser.uid == userData) {
          String isAdminText = data['isAdmin'].toString();
          if (isAdminText == 'true') {
            return true;
          }
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPage(data: widget.data),
      body: FutureBuilder<bool>(
        future: _isAdmin(),
        builder: (context, snapshot) {
          if (snapshot.hasError || snapshot.data == false) {
            return pageSelection(); // Return default page if error or not an admin
          }
          // If admin, return the admin page
          return AdminPanel();
        },
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }

  // Select the page based on the index
  Widget pageSelection() {
    if (widget.selectedIndex == 0) {
      return const WeddingForm(data: false);
    } else if (widget.selectedIndex == 1) {
      return const CorporateForm(data: false);
    } else if (widget.selectedIndex == 2) {
      return const PartyForm(data: false);
    } else if (widget.selectedIndex == 3) {
      return const Services(data: false);
    } else if (widget.selectedIndex == 4) {
      return const MatchMaking();
    } else if (widget.selectedIndex == 5) {
      return const Galleries();
    } else if (widget.selectedIndex == 6) {
      return const SurveyForm(data: false);
    } else if (widget.selectedIndex == 7) {
      return const LandingPage();
    } else if (widget.selectedIndex == 8) {
      return const InquiryForm(data: false);
    } else {
      return const LandingPage();
    }
  }
}
