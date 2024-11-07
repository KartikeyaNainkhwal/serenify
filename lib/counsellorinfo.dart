import 'package:flutter/material.dart';
// import 'make'
import 'make_appointment.dart';
class CounselorInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counselor Information'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.grey[100], // Light background color
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 8, // Adds shadow for depth
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/counselor.jpg'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Dr. Sarah Johnson',
                    style: TextStyle(
                      fontSize: 28,
                      
                      fontWeight: FontWeight.bold,
                      color: Colors.black87, // Darker text color
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Qualification: PhD in Clinical Psychology\n'
                    'Experience: 10 years\n'
                    'Contact: sarah.johnson@example.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54, // Subtle text color
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
          // Navigate to the AI Companion Screen or Survey Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScheduleAppointmentPage()), // Change to AICompanionScreen if needed
                    );
                    },
                    child: Text('Schedule Appointment'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent, // Button color
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded button
                      ),
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
}
