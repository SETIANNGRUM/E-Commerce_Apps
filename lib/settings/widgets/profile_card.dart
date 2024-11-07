import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String profileImagePath;

  ProfileCard({required this.name, required this.profileImagePath});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(profileImagePath),
        radius: 30,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text('View Profile'),
      trailing: Icon(Icons.settings, color: Colors.black),
      onTap: () {
        // Handle profile view action
      },
    );
  }
}
