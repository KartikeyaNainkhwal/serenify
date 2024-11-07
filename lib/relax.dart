import 'package:flutter/material.dart';
import 'music_screen.dart';
import 'yoga_page.dart';
import 'breathing_exercises_page.dart';
import 'meditation_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stress Relief App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ActivitySuggestionsScreen(),
    );
  }
}

class ActivitySuggestionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7EBAF8),
        title: Text(
          'Activity Recommendations',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ActivityCard(
              imagePath: 'assets/yoga.png',
              label: 'Yoga',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YogaPage()),
                );
              },
            ),
            SizedBox(height: 16),
            ActivityCard(
              imagePath: 'assets/music.png',
              label: 'Music',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MusicScreen()),
                );
              },
            ),
            SizedBox(height: 16),
            ActivityCard(
              imagePath: 'assets/breathing.png',
              label: 'Breathing\nExercise',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BreathingExercisesPage()),
                );
              },
            ),
            SizedBox(height: 16),
            ActivityCard(
              imagePath: 'assets/meditation.png',
              label: 'Meditation',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MeditationPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  ActivityCard({required this.imagePath, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              // Image Section
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: 80, // Adjust width as needed
                  height: 80, // Adjust height as needed
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16), // Space between image and text
              // Text Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333), // Dark text for better readability
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Tap to explore more activities that help reduce stress.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600], // Lighter grey for secondary text
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
