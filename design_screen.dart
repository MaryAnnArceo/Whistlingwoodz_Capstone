


import 'package:flutter/material.dart';
import 'package:whistlingwoodz/screens/corporate_events_screen.dart';
import 'package:whistlingwoodz/screens/match_making_screen.dart';
import 'package:whistlingwoodz/screens/parties_screen.dart';
import 'package:whistlingwoodz/screens/wedding_celebrations_screen.dart';
import 'package:whistlingwoodz/widgets/design_card.dart';

class DesignScreen extends StatefulWidget {
  const DesignScreen({super.key});

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {

  final names = [
    'Wedding',
    'Corporate',
    'Parties',
    'Guest'
  ];

  final icons = [
    Icons.camera_alt,
    Icons.corporate_fare,
    Icons.people_outlined,
    Icons.cases_outlined
  ];
  final screens = [
    const WeddingForm(data: false),
    const CorporateForm(data: false),
    const PartyForm(data: false),
    const MatchMaking()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back2.png"),
              opacity: 1,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: names.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
              ),
              itemBuilder: (context, index) {
                return DesignCard(
                  name: names[index],
                  icon: icons[index],
                screen: screens[index],);
              },
            ),
          ),
        ),
      ],
    );
  }


}
