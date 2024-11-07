import 'package:flutter/material.dart';
import 'settings.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String profilePicUrl = 'https://via.placeholder.com/150'; // Replace with your image URL
  final String name = 'Shreyash';
  final List<String> achievements = [
    'Completed 10 yoga sessions',
    'Meditated for 30 days straight',
    'Participated in stress management workshop',
  ];
  final int stressLevel = 75; // Set current stress level (1 to 100)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to the Settings Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewApp()), // Change to AICompanionScreen if needed
              );
            },
          ),
        ],
        backgroundColor: Colors.transparent, // Transparent AppBar background
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/secondbg.png'), // Use your asset path here
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content overlay
          Container(
            // color: Colors.white.withOpacity(0.85), // Semi-transparent overlay
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Picture
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(profilePicUrl),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Name
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Black text for the name
                    ),
                  ),
                  SizedBox(height: 8),
                  // Stress Meter
                  Text(
                    'Stress Level: $stressLevel',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Black text for stress level
                    ),
                  ),
                  SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Rounded edges
                    child: LinearProgressIndicator(
                      value: stressLevel / 100,
                      minHeight: 20,
                      backgroundColor: Colors.grey[300], // Light background
                      valueColor: AlwaysStoppedAnimation<Color>(
                        stressLevel > 70 ? Colors.blue : Colors.blue, // Blue color for normal levels
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Achievements Section
                  Text(
                    'Achievements:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Black text for achievements
                    ),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: achievements.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              achievements[index],
                              style: TextStyle(fontSize: 19, color: const Color.fromARGB(255, 13, 56, 92)), // Darker blue text for achievements
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Additional Info Section can be added here if needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
