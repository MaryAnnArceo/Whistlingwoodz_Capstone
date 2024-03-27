import 'package:flutter/material.dart';
import 'package:whistlingwoodz/main.dart';
import 'package:url_launcher/url_launcher.dart';

// This class is for the Service page.
// This page has two functions.
// 1. Clicking on each service section will take you to the Whistling Woods website.
// 2. There is Floating Action Button for navigation to the inquiry form.
class Services extends StatefulWidget {
  const Services({super.key, required this.data});
  final bool data;

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  // This method is used to navigate to the inquiry form page.
  inquiryFunction() {
    runApp(MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Whistlingwoodz',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      // ignore: prefer_const_constructors
      home: MyApp(selectedIndex: 8),
    ));
  }

  // Service list
  final List<ServiceModel> services = [
    ServiceModel(
      title: "Understanding the Event Genre",
      imageUrl: "assets/images/simage1.png",
    ),
    ServiceModel(
      title: "Venue Design and Production",
      imageUrl: "assets/images/vimage2.png",
    ),
    ServiceModel(
      title: "Event \nPlanning",
      imageUrl: "assets/images/evimage4.png",
    ),
    ServiceModel(
      title: "Entertainment & Performances",
      imageUrl: "assets/images/perimage5.png",
    ),
    ServiceModel(
      title: "Commute & \nCabs",
      imageUrl: "assets/images/ccimage6.png",
    ),
    ServiceModel(
      title: "Vendors \nRange",
      imageUrl: "assets/images/venimage7.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _launchURL();
            },
            // the card that contains the services
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      services[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      // as services list is used, the index is used to get the respective title with image
                      services[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      // Floating Action Button for navigation to the inquiry form
      floatingActionButton: buildNavigationButton(),
    );
  }

  // Callback function to launch the website
  _launchURL() async {
    final Uri url = Uri.parse('https://whistlingwoodz.com.au/contact-us');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Floating Action Button for navigation to the inquiry form
  Widget buildNavigationButton() => FloatingActionButton(
        onPressed: () {
          // call the inquiryFunction here
          inquiryFunction();
        },
        backgroundColor: Colors.yellow[900],
        shape: const CircleBorder(),
        child: const Icon(
          Icons.mode_edit,
          color: Colors.white,
        ),
      );
}

class ServiceModel {
  final String title;
  final String imageUrl;

  ServiceModel({required this.title, required this.imageUrl});
}
