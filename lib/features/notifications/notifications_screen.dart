import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'Here are your notifications',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
