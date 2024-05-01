import 'package:flutter/material.dart';
import 'package:whistlingwoodz/utils/app_utils.dart';
import 'package:whistlingwoodz/screens/admin/inquiries_screen.dart';
import 'package:whistlingwoodz/screens/admin/setting_screen.dart';
import 'package:whistlingwoodz/screens/admin/firestore_dashboard.dart';

// This is a admin panel screen.
// And this screen is used to show the dashboard, inquiry and setting screens.
// But, it has only front-end part. There is no back-end developed.  (It hasn't developed due to the time issue.)
class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  // the method to change the tab
  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // the method to initialize the tab controller
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    _tabController.addListener(
      () => setState(() => _selectedIndex = _tabController.index),
    );
  }

  // the method to dispose the tab controller
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Admin Panel',
            style: TextStyle(color: appBackGroundColor),
          ),
          centerTitle: true,
          titleSpacing: 30,
          backgroundColor: Colors.amberAccent,
          toolbarHeight: MediaQuery.of(context).size.width * 0.10,
          elevation: 0,
          // tab bar is used for controlling dashboard, inquiry and setting screens
          bottom: TabBar(
            controller: _tabController,
            labelColor: appBackGroundColor,
            unselectedLabelColor: Colors.white,
            indicator: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            onTap: onTabTapped,
            // the tabs are created here
            tabs: [
              Tab(
                icon: Icon(
                  _selectedIndex == 0
                      ? Icons.dashboard
                      : Icons.dashboard_outlined,
                  color:
                      _selectedIndex == 0 ? appBackGroundColor : Colors.white,
                ),
                text: "Dashboard",
              ),
              Tab(
                icon: Icon(
                  _selectedIndex == 1
                      ? Icons.question_answer
                      : Icons.question_answer_outlined,
                  color:
                      _selectedIndex == 1 ? appBackGroundColor : Colors.white,
                ),
                text: "Inquiry",
              ),
              Tab(
                icon: Icon(
                  _selectedIndex == 2
                      ? Icons.settings
                      : Icons.settings_outlined,
                  color:
                      _selectedIndex == 2 ? appBackGroundColor : Colors.white,
                ),
                text: "Setting",
              ),
            ],
          ),
        ),
        // the body of the admin panel and it is a tab bar view
        body: TabBarView(
          controller: _tabController,
          children: const [
            FirestoreRead(),
            InquiryList(),
            AdminSetting(),
          ],
        ),
      ),
    );
  }
}
