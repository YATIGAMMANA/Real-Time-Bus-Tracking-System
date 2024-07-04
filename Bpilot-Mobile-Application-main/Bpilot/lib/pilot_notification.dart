import 'package:flutter/material.dart';

class PilotNotificationScreen extends StatelessWidget {
  final String busRegistrationNumber;

  const PilotNotificationScreen({super.key, required this.busRegistrationNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilot Notifications'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sending notification from Bus: $busRegistrationNumber',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement logic to send the notification
              },
              child: const Text('Send Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
