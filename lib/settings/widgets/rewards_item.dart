import 'package:flutter/material.dart';

class RewardsItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String timer;
  final bool showDot;

  RewardsItem(
      {required this.title,
      required this.subtitle,
      this.timer = '',
      this.showDot = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          if (timer.isNotEmpty)
            Text(timer, style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
      subtitle: subtitle.isNotEmpty
          ? Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: subtitle.startsWith('Was') ? Colors.red : Colors.blue,
                decoration: subtitle.startsWith('Was')
                    ? TextDecoration.lineThrough
                    : null,
              ),
            )
          : null,
      trailing:
          showDot ? Icon(Icons.circle, size: 10, color: Colors.red) : null,
      onTap: () {
        // Handle rewards tap action
      },
    );
  }
}
