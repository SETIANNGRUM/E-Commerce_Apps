// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        // ignore: duplicate_ignore
        // ignore: prefer_const_constructors
        child: Text(
          'Here are your orders',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
