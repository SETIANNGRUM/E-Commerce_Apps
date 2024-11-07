// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CustomerSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Support'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'Contact customer support here',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
