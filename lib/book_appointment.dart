import 'package:flutter/material.dart';
import 'counsellorinfo.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Set the initial screen to a different page if desired
      routes: {
        '/counsiller': (context) => CounsillerPage(), // Define the named route
        // Add other routes here as needed
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/counsiller'); // Navigate to CounsillerPage
          },
          child: Text('Go to Profile Page'),
        ),
      ),
    );
  }
}

class CounsillerPage extends StatelessWidget {
  final String profilePicUrl = 'https://via.placeholder.com/150'; // Replace with your image URL
  final String name = 'John Doe';
  final List<String> appointments = [
    'Doctor Appointment - 01/09/2024',
    'Meeting with Client - 02/09/2024',
    'Dentist Appointment - 15/09/2024',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
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
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 16),
            // Previous Booked Appointments
            Text(
              'Previous Booked Appointments:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        appointments[index],
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            // Navigate to Counselor Info Page Button
            Center(
              child: ElevatedButton(
                onPressed: () {
          // Navigate to the AI Companion Screen or Survey Page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CounselorInfoScreen()), // Change to AICompanionScreen if needed
            );
            },
                child: Text('View Counselor Info'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
