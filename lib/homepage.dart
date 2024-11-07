import 'package:flutter/material.dart';
import 'chat.dart';
import 'book_appointment.dart';
import 'profile.dart';
import 'relax.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  double _stressPercentage = 60.0; // Example stress percentage

  // Callback for navigation item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/firstbg.png'), // Use your asset path here
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), // Adjust opacity here
                BlendMode.darken,
              ),
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0), // Increased top padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40), // Added space above Stress Level
                // Stress Meter
                Text(
                  'Stress Level',
style: TextStyle(color: Colors.black, fontSize: 19, fontWeight: FontWeight.w600),

                ),
                SizedBox(height: 5),
                LinearProgressIndicator(
                  value: _stressPercentage / 100,
                  minHeight: 10,
                  backgroundColor: Colors.grey[300],
                  color: Colors.blue,
                ),
                SizedBox(height: 5),
                Text(
                  '${_stressPercentage.toStringAsFixed(0)}%',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(height: 40), // Added space above the image

                // Center the image and button
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/bg1.jpg', // Use your asset path here
                            height: 180, // Reduced image height slightly
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Increased space above the button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ActivitySuggestionsScreen()),
                          );
                        },
                        child: Text('Commence Relaxation'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bottom navigation buttons
          Positioned(
            bottom: 20, // Position from the bottom of the screen
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    _onItemTapped(0);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: Text('Profile'),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    foregroundColor: Colors.white,
                    backgroundColor: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                  child: Text('Chat'),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    foregroundColor: Colors.white,
                    backgroundColor: _selectedIndex == 1 ?  Colors.blue : Colors.grey,
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _onItemTapped(2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CounsillerPage()),
                    );
                  },
                  child: Text('Counselor'),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    foregroundColor: Colors.white,
                    backgroundColor: _selectedIndex == 2 ?  Colors.blue : Colors.grey,
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
