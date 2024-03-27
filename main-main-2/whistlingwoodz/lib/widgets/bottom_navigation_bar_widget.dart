import 'package:flutter/material.dart';
import 'package:whistlingwoodz/utils/app_utils.dart';
import 'package:whistlingwoodz/main.dart';

// This class for the Bottom Navigation Bar widget
class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  // The function of the bottom navigation bar to navigate to each tab selected
  navigationTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
    runApp(MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Whistlingwoodz',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyApp(selectedIndex: _selectedIndex),
    ));
  }

  // initialize the tab controller and index
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 6,
      vsync: this,
    );
    _tabController.addListener(
      () => setState(() => _selectedIndex = _tabController.index),
    );
  }

  // dispose the tab controller
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TabBar(
        controller: _tabController,
        labelColor: bottomNavigationColor,
        tabs: const [
          // Wedding tab
          Tab(
            icon: Icon(
              Icons.people_outlined,
            ),
            text: "W",
          ),
          // Corporate tab
          Tab(
            icon: Icon(
              Icons.add_business_outlined,
            ),
            text: "C",
          ),
          // Party tab
          Tab(
            icon: Icon(
              Icons.wine_bar_outlined,
            ),
            text: "P",
          ),
          // Service tab
          Tab(
            icon: Icon(
              Icons.room_service_outlined,
            ),
            text: "S",
          ),
          // Match Making tab
          Tab(
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
            text: "M",
          ),
          // Gallery tab
          Tab(
            icon: Icon(
              Icons.party_mode_outlined,
            ),
            text: "G",
          ),
        ],
        // event for the bottom navigation bar
        onTap: navigationTapped,
      ),
    );
  }
}
