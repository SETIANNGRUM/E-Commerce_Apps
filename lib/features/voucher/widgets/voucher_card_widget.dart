// lib/features/voucher/widgets/voucher_card_widget.dart
import 'package:flutter/material.dart';

class VoucherCardWidget extends StatelessWidget {
  final String title;
  final String validity;
  final Color color;

  const VoucherCardWidget({
    super.key,
    required this.title,
    required this.validity,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: const Icon(Icons.card_giftcard, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    validity,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement the action to use the voucher
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Voucher applied!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
              ),
              child: const Text('Use Now'),
            ),
          ],
        ),
      ),
    );
  }
}
