import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// This class is for the Gallery page.
// This page has a function only for linking to the Whistlingwoodz website.
class Galleries extends StatefulWidget {
  const Galleries({super.key});

  @override
  State<Galleries> createState() => _GalleriesState();
}

class _GalleriesState extends State<Galleries> {
  // photo gallery list
  final List<ServiceModel> photos = [
    ServiceModel(
      imageUrl: "assets/images/weddingPage.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/corporatePage.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/partyPage.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/twohearts.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/photoGallery_place1.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/photoGallery_place2.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/photoGallery_place3.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/photoGallery_place4.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/photoGallery_place5.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/photoGallery_place6.png",
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
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _launchURL();
            },
            // the card that contains the photo gallery
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      // as photos list is used, the index is used to get the respective image
                      photos[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Callback function to launch the website
  _launchURL() async {
    final Uri url = Uri.parse('https://whistlingwoodz.com.au/photo-gallery');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ServiceModel {
  final String imageUrl;
  ServiceModel({required this.imageUrl});
}
