// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whistlingwoodz/models/dashboard.dart';

// This class is used to show the counts of the respective event.
// But, it has only front-end part. There is no back-end developed.  (It hasn't developed due to the time issue.)
class FirestoreRead extends StatefulWidget {
  const FirestoreRead({super.key});

  @override
  State<FirestoreRead> createState() => _FirestoreReadState();
}

class _FirestoreReadState extends State<FirestoreRead> {
  // weddings stream
  final Stream<QuerySnapshot> _weddingsStream =
      FirebaseFirestore.instance.collection('weddings').snapshots();

  // initialize all event counts and list that can save that information
  String userCount = "";
  String weddingCount = "";
  String corporateCount = "";
  String partyCount = "";
  String inquiryCount = "";
  String surveyCount = "";
  List documentsCountList = [];

  // the method to read data from the firestore
  Future readData() async {
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      // Get the documents from the collection
      QuerySnapshot<Map<String, dynamic>> userCollection =
          await FirebaseFirestore.instance.collection("users").get();
      QuerySnapshot<Map<String, dynamic>> weddingCollection =
          await FirebaseFirestore.instance.collection("weddings").get();
      QuerySnapshot<Map<String, dynamic>> corporateCollection =
          await FirebaseFirestore.instance.collection("corporates").get();
      QuerySnapshot<Map<String, dynamic>> partyCollection =
          await FirebaseFirestore.instance.collection("parties").get();
      QuerySnapshot<Map<String, dynamic>> inquiryCollection =
          await FirebaseFirestore.instance.collection("inquiries").get();
      QuerySnapshot<Map<String, dynamic>> surveyCollection =
          await FirebaseFirestore.instance.collection("surveys").get();

      // Now you can access the documents from the collection
      List<QueryDocumentSnapshot<Map<String, dynamic>>> userDocuments =
          userCollection.docs;
      List<QueryDocumentSnapshot<Map<String, dynamic>>> weddingDocuments =
          weddingCollection.docs;
      List<QueryDocumentSnapshot<Map<String, dynamic>>> corporateDocuments =
          corporateCollection.docs;
      List<QueryDocumentSnapshot<Map<String, dynamic>>> partyDocuments =
          partyCollection.docs;
      List<QueryDocumentSnapshot<Map<String, dynamic>>> inquiryDocuments =
          inquiryCollection.docs;
      List<QueryDocumentSnapshot<Map<String, dynamic>>> surveyDocuments =
          surveyCollection.docs;

      // Get the all count of the documents for the each events
      userCount = userDocuments.length.toString();
      weddingCount = weddingDocuments.length.toString();
      corporateCount = corporateDocuments.length.toString();
      partyCount = partyDocuments.length.toString();
      inquiryCount = inquiryDocuments.length.toString();
      surveyCount = surveyDocuments.length.toString();

      // add up all the counts to the list
      documentsCountList.add(userCount);
      documentsCountList.add(weddingCount);
      documentsCountList.add(corporateCount);
      documentsCountList.add(partyCount);
      documentsCountList.add(inquiryCount);
      documentsCountList.add(surveyCount);

      // test - print the list
      if (documentsCountList.isNotEmpty) {
        // Print data from the first document
        print("user documents count: $userCount");
        print("wedding documents count: $weddingCount");
        print("corporate documents count: $corporateCount");
        print("party documents count: $partyCount");
        print("inquiry documents count: $inquiryCount");
        print("survey documents count: $surveyCount");
      } else {
        print("No documents found in the collection.");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  // list of all the services
  final List<DashboardScreen> services = [
    DashboardScreen(
      title: "4",
      subtitle: "Users",
    ),
    DashboardScreen(
      title: "23",
      subtitle: "Weddings",
    ),
    DashboardScreen(
      title: "5",
      subtitle: "Corporates",
    ),
    DashboardScreen(
      title: "6",
      subtitle: "Parties",
    ),
    DashboardScreen(
      title: "7",
      subtitle: "Inquiries",
    ),
    DashboardScreen(
      title: "8",
      subtitle: "Surveys",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    readData();
    return StreamBuilder<QuerySnapshot>(
      stream: _weddingsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.3,
          ),
          itemCount: services.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // show the details of the respective event
              },
              // the card that contains the event details
              child: Card(
                elevation: 5,
                color: Colors.grey[100],
                shadowColor: Colors.grey[900],
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Text(
                        // as services list is used, the index is used to get the respective title and subtitle
                        services[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            height: 4,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Text(
                        // as services list is used, the index is used to get the respective title and subtitle
                        services[index].subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
