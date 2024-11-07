import 'package:flutter/material.dart';

class BottomMenuWidget extends StatelessWidget {
  const BottomMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MenuItem(icon: Icons.category, label: "Category"),
        MenuItem(icon: Icons.flight, label: "Flight"),
        MenuItem(icon: Icons.receipt, label: "Bill"),
        MenuItem(
            icon: Icons.data_usage,
            label: "Data Plan"), // New Data Plan Menu Item
        MenuItem(icon: Icons.phone_android, label: "Top Up"),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const MenuItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.blue),
          onPressed: () {
            // Add specific action for each button here if needed
          },
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
