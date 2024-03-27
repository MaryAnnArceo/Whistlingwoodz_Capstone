import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whistlingwoodz/main.dart';
import 'package:whistlingwoodz/models/wedding.dart';
import 'package:uuid/uuid.dart';

class WeddingForm extends StatefulWidget {
  const WeddingForm({super.key, required this.data});
  final bool data;

  @override
  State<WeddingForm> createState() => _WeddingState();
}

// This is a wedding event screen.
class _WeddingState extends State<WeddingForm> {
  // controllers variables for the text form fields
  final venueController = TextEditingController();
  final guestNoController = TextEditingController();
  final budgetController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();

  // dispose the controllers
  @override
  void dispose() {
    venueController.dispose();
    guestNoController.dispose();
    budgetController.dispose();
    emailController.dispose();
    phoneNoController.dispose();
    super.dispose();
  }

  // generate unique id for the corporates collection
  generateId() {
    const uuid = Uuid();
    return uuid.v4();
  }

  // submit button function to save the data in the firestore
  Future submit() async {
    late final wedding = Wedding(
      id: generateId().toString(),
      type: 'Wedding',
      theme: _selectedTheme,
      function: _selectedFunction,
      venue: _selectedVenue == _venueList[6]
          ? venueController.text.trim()
          : _selectedVenue,
      guestNo: guestNoController.text.trim(),
      budget: _selectedBudget == _budgetList[3]
          ? budgetController.text.trim()
          : _selectedBudget,
      email: emailController.text.toLowerCase().trim(),
      phoneNo: phoneNoController.text.trim(),
      timeStamp: Timestamp.now(),
    );
    // Add the weddings collection to the firestore
    addInquiryDetails(wedding);
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  // This method adds the weddings collection entered by the user to the firestore.
  Future addInquiryDetails(Wedding wedding) async {
    await FirebaseFirestore.instance
        .collection('weddings')
        .add(wedding.toJson());
  }

  // This method is used to navigate to the survey page.
  surveyFunction() {
    runApp(MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Whistlingwoodz',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      // ignore: prefer_const_constructors
      home: MyApp(selectedIndex: 6),
    ));
  }

  // list variables for drop-down menus
  final List<String> _themeList = [
    "Classic",
    "Contemporary",
    "Customized",
  ];
  final List<String> _functionList = [
    "Haldi - Mehndi",
    "Shagun - Engagement",
    "Wedding",
    "Reception",
  ];
  final List<String> _venueList = [
    "Hyatt Place Melbourne",
    "Hyatt Place Caribbean Park",
    "Grand Hyatt Melbourne",
    "Park Hyatt Melbourne",
    "Hyatt Centric Melbourne",
    "The Langham Melbourne",
    "Other",
  ];
  final List<String> _budgetList = [
    r"$20,000 - $29,999",
    r"$30,000 - $39,999",
    r"$40,000 - $60,000",
    "Other",
  ];

  // initial values for drop-down menus
  String _selectedTheme = "Classic";
  String _selectedFunction = "Haldi - Mehndi";
  String _selectedVenue = "Hyatt Place Melbourne";
  String _selectedBudget = r"$20,000 - $29,999";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/weddingPage.png"),
            opacity: 0.5,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'WEDDING',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildTheme(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _buildFunction(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  if (_selectedVenue != _venueList[6])
                                    _buildVenue(),
                                  // if other is selected in the venue drop down menu
                                  if (_selectedVenue == _venueList[6])
                                    TextFormField(
                                      controller: venueController,
                                      autofocus: false,
                                      decoration: const InputDecoration(
                                        labelText: "Other Venue*",
                                        prefixIcon: Icon(
                                          Icons.place,
                                          color: Colors.deepOrangeAccent,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _buildGuest(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  if (_selectedBudget != _budgetList[3])
                                    _buildBudget(),
                                  // if other is selected in the venue drop down menu
                                  if (_selectedBudget == _budgetList[3])
                                    TextFormField(
                                      controller: budgetController,
                                      autofocus: false,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelText: "Other*",
                                        prefixIcon: Icon(
                                          Icons.attach_money,
                                          color: Colors.deepOrangeAccent,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _buildEmail(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _buildPhone(),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  _buildSubmit(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // guest text form field
  Widget _buildGuest() => TextFormField(
        controller: guestNoController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: "Number of Guests*",
          prefixIcon: Icon(
            Icons.group,
            color: Colors.deepOrangeAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );

  // email text form field
  Widget _buildEmail() => TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: "Email*",
          prefixIcon: Icon(
            Icons.email,
            color: Colors.deepOrangeAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );

  // phone text form field
  Widget _buildPhone() => TextFormField(
        controller: phoneNoController,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          labelText: "Phone*",
          prefixIcon: Icon(
            Icons.phone,
            color: Colors.deepOrangeAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );

  // Theme drop-down menu
  Widget _buildTheme() => DropdownButtonFormField(
        value: _selectedTheme,
        items: _themeList
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedTheme = value as String;
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          size: 20,
          color: Colors.deepOrangeAccent,
        ),
        dropdownColor: Colors.yellow.shade50,
        decoration: const InputDecoration(
          labelText: "Select Theme*",
          prefixIcon: Icon(
            Icons.subject,
            color: Colors.deepOrangeAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );

  // Function drop-down menu
  Widget _buildFunction() => DropdownButtonFormField(
        value: _selectedFunction,
        items: _functionList
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedFunction = value as String;
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          size: 20,
          color: Colors.deepOrangeAccent,
        ),
        dropdownColor: Colors.yellow.shade50,
        decoration: const InputDecoration(
          labelText: "Select Function*",
          prefixIcon: Icon(
            Icons.book_online,
            color: Colors.deepOrangeAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );

  // Venue drop-down menu
  Widget _buildVenue() => DropdownButtonFormField(
        value: _selectedVenue,
        items: _venueList
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedVenue = value as String;
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          size: 20,
          color: Colors.deepOrangeAccent,
        ),
        dropdownColor: Colors.yellow.shade50,
        decoration: const InputDecoration(
          labelText: "Select Venue*",
          prefixIcon: Icon(
            Icons.place,
            color: Colors.deepOrangeAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );

  // Budget drop-down menu
  Widget _buildBudget() => DropdownButtonFormField(
        value: _selectedBudget,
        items: _budgetList
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedBudget = value as String;
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          size: 20,
          color: Colors.deepOrangeAccent,
        ),
        dropdownColor: Colors.yellow.shade50,
        decoration: const InputDecoration(
          labelText: "Select Budget*",
          prefixIcon: Icon(
            Icons.attach_money,
            color: Colors.deepOrangeAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );

  // submit button
  Widget _buildSubmit() => SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 26),
            foregroundColor: Colors.yellowAccent,
            backgroundColor: Colors.yellow[900],
            elevation: 15,
            shadowColor: Colors.grey,
            shape: const StadiumBorder(),
          ),
          onPressed: () {
            // call the submit function here
            submit();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Form Submitted"),
                content: const Text("Thank you for your submission!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // navigate to the survey page
                      surveyFunction();
                    },
                    child: const Text("Close"),
                  ),
                ],
              ),
            );
          },
          child: Text(
            "Submit Form".toUpperCase(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.white,
            ),
          ),
        ),
      );
}
