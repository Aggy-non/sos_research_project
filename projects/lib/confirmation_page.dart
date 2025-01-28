import 'package:flutter/material.dart';
import 'emergency_data.dart'; // Import the EmergencyData class

class ConfirmationPage extends StatelessWidget {
  final EmergencyData emergencyData;

  const ConfirmationPage({Key? key, required this.emergencyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Your SOS has been sent successfully!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Help is on its way. Stay safe!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Type: ${emergencyData.type}\n'
                    'People in Danger: ${emergencyData.people}\n'
                    'Needs: ${emergencyData.needs}\n'
                    'Injuries: ${emergencyData.injuries}\n'
                    'Location: ${emergencyData.location}\n'
                    'Contact: ${emergencyData.contact}\n'
                    'Timestamp: ${emergencyData.timestamp}',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to home or previous page
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Red background color
                  foregroundColor: Colors.white, // White text color
                ),
                child: const Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}