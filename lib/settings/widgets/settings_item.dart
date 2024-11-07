import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool showDot;

  SettingsItem({required this.icon, required this.title, this.showDot = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing:
          showDot ? Icon(Icons.circle, size: 10, color: Colors.red) : null,
      onTap: () {
        // Handle item tap action
      },
    );
  }
}
