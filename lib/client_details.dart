import 'package:flutter/material.dart';

class ClientDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Client: John Doe'),
              subtitle: Text('Appointment: 2024-10-01, 10:00 AM'),
            ),
            Divider(),
            ListTile(
              title: Text('Client: Jane Smith'),
              subtitle: Text('Appointment: 2024-10-03, 1:00 PM'),
            ),
            Divider(),
            // Add more clients as needed
          ],
        ),
      ),
    );
  }
}