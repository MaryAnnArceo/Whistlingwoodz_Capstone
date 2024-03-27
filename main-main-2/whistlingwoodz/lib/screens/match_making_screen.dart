import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// This class is for the Match Making page.
// This page has a function only for linking to the Whistlingwoodz website.
class MatchMaking extends StatefulWidget {
  const MatchMaking({Key? key}) : super(key: key);

  @override
  State<MatchMaking> createState() => _MatchMakingState();
}

class _MatchMakingState extends State<MatchMaking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // backgound photo for landing page
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
              decoration: const BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
                    child: Column(
                      // There is only a front-end.
                      children: [
                        _buildSectionTitle('Personal Information:'),
                        _buildFullNameField('Bride'),
                        _buildFullNameField('Groom'),
                        _buildGenderField('Bride'),
                        _buildGenderField('Groom'),
                        _buildDateOfBirthField('Bride'),
                        _buildDateOfBirthField('Groom'),
                        _buildPlaceOfBirthField('Bride'),
                        _buildPlaceOfBirthField('Groom'),
                        _buildTextField('Caste',
                            'Specify the caste of the bride and groom.'),
                        _buildTextField('Religion',
                            'Specify the religion of the bride and groom.'),
                        _buildTextField('Sub-Caste (if applicable)',
                            'Specify the sub-caste details.'),
                        _buildSectionTitle('Contact Information:'),
                        _buildTextField('Email Address - Bride',
                            'Enter bride\'s email address.'),
                        _buildTextField('Email Address - Groom',
                            'Enter groom\'s email address.'),
                        _buildTextField('Phone Number - Bride',
                            'Enter bride\'s phone number.'),
                        _buildTextField('Phone Number - Groom',
                            'Enter groom\'s phone number.'),
                        _buildSectionTitle('Educational Background:'),
                        _buildTextField('Education Level - Bride',
                            'Enter bride\'s highest education level.'),
                        _buildTextField('Education Level - Groom',
                            'Enter groom\'s highest education level.'),
                        _buildTextField(
                            'Occupation - Bride', 'Enter bride\'s occupation.'),
                        _buildTextField(
                            'Occupation - Groom', 'Enter groom\'s occupation.'),
                        _buildSectionTitle('Family Details:'),
                        _buildTextField('Family Background - Bride',
                            'Briefly describe bride\'s family background.'),
                        _buildTextField('Family Background - Groom',
                            'Briefly describe groom\'s family background.'),
                        _buildTextField('Siblings',
                            'Number of siblings and their details (if applicable).'),
                        _buildSectionTitle('Preferences:'),
                        _buildTextField('Partner Preferences',
                            'Specify the qualities and characteristics preferred in a life partner.'),
                        _buildTextField('Cultural Preferences',
                            'Specify any cultural or religious preferences.'),
                        _buildSectionTitle('Photographs:'),
                        _buildTextField('Recent Photographs',
                            'Attach recent photographs of the bride and groom.'),
                        _buildSectionTitle('Additional Information:'),
                        _buildTextField('Specific Considerations',
                            'Include any additional information that may be relevant.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: buildNavigationButton(),
    );
  }

  // Floating Action Button for navigation to the inquiry form
  Widget buildNavigationButton() => FloatingActionButton(
        onPressed: () {
          _launchURL();
        },
        backgroundColor: Colors.yellow[900],
        shape: const CircleBorder(),
        child: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      );

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFullNameField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label\'s Full Name:'),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter $label\'s full name',
          ),
        ),
      ],
    );
  }

  Widget _buildGenderField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label\'s Gender:'),
        Row(
          children: [
            Radio(value: 'Female', groupValue: null, onChanged: (value) {}),
            const Text('Female'),
            Radio(value: 'Male', groupValue: null, onChanged: (value) {}),
            const Text('Male'),
          ],
        ),
      ],
    );
  }

  Widget _buildDateOfBirthField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label\'s Date of Birth:'),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter $label\'s date of birth',
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceOfBirthField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label\'s Place of Birth:'),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter $label\'s place of birth',
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label:'),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
      ],
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
}
