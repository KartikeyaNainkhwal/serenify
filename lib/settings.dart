import 'package:flutter/material.dart';

class NewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String profilePicUrl = 'https://via.placeholder.com/150'; // Initial Profile Picture
  String name = 'Shreyash'; // Initial Name
  String? selectedAbout; // Variable to hold selected item from dropdown
  bool isPrivacyPolicyExpanded = false; // Variable to manage dropdown state
  bool isAboutAppExpanded = false; // Variable to manage about app dropdown state

  final List<String> aboutOptions = [
    'Version 1.0',
    'Version 1.1',
    'Version 1.2',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profilePicUrl),
                  ),
                  SizedBox(height: 8),
                  Text(
                    name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Change Profile Picture Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement change profile picture functionality
                  // You might want to use an image picker package here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  elevation: 4,
                  padding: EdgeInsets.symmetric(vertical: 12.0), // Button height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Rounded corners
                    side: BorderSide(color: Colors.blue), // Blue border
                  ),
                ),
                child: Text(
                  '   Change Profile Picture   ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Edit Name
            TextField(
              decoration: InputDecoration(
                labelText: 'Edit Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  name = value; // Update the name in state
                });
              },
            ),
            SizedBox(height: 16),
            // About App Dropdown
            GestureDetector(
              onTap: () {
                setState(() {
                  isAboutAppExpanded = !isAboutAppExpanded;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'About App',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    isAboutAppExpanded
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                  ),
                ],
              ),
            ),
            if (isAboutAppExpanded) ...[
              SizedBox(height: 8),
              Text(
                'This app helps users manage stress through various activities and exercises.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Current Version: ${aboutOptions[0]}', // Display the first version by default
                style: TextStyle(fontSize: 16),
              ),
            ],
            SizedBox(height: 16),
            // Privacy Policy Section
            GestureDetector(
              onTap: () {
                setState(() {
                  isPrivacyPolicyExpanded = !isPrivacyPolicyExpanded;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Privacy Policy',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    isPrivacyPolicyExpanded
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                  ),
                ],
              ),
            ),
            if (isPrivacyPolicyExpanded) ...[
              SizedBox(height: 8),
              Text(
                'Your privacy is important to us. Please read our privacy policy carefully.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(NewApp());
}
