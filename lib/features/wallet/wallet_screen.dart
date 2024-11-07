import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metode Pembayaran'),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPaymentSection('Rekomendasi', [
              _buildPaymentItem(context, 'DANA', 'assets/dana_icon.png'),
            ]),
            const SizedBox(height: 16),
            _buildPaymentSection('Virtual Account', [
              _buildPaymentItem(context, 'Virtual Account Mandiri',
                  'assets/mandiri_icon.png'),
              _buildPaymentItem(
                  context, 'Virtual Account BNI', 'assets/bni_icon.png'),
              _buildPaymentItem(context, 'Virtual Account Permata',
                  'assets/permata_icon.png'),
            ]),
            const SizedBox(height: 16),
            _buildPaymentSection('Kartu Kredit / Debit', [
              _buildPaymentItem(
                  context, 'Kartu Kredit', 'assets/credit_card_icon.png'),
            ]),
            const SizedBox(height: 16),
            _buildPaymentSection('Gerai', [
              _buildPaymentItem(context, 'GoPay', 'assets/gopay_icon.png'),
              _buildPaymentItem(
                  context, 'Indomaret', 'assets/Indomaret_icon.png'),
              _buildPaymentItem(
                  context, 'Alfamart & Alfamidi', 'assets/alfamart_icon.png'),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSection(String title, List<Widget> paymentItems) {
    if (paymentItems.isEmpty) {
      return Container(); // Mengembalikan widget kosong jika tidak ada metode pembayaran
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...paymentItems,
      ],
    );
  }

  Widget _buildPaymentItem(
      BuildContext context, String label, String iconPath) {
    return GestureDetector(
      onTap: () {
        if (label.isNotEmpty) {
          print("Metode pembayaran dipilih: $label"); // Debugging
          Navigator.pop(context, label); // Mengembalikan label yang dipilih
        } else {
          print("Metode pembayaran kosong!");
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              height: 30,
              width: 30,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 30,
                  width: 30,
                  color: Colors.grey[200],
                  child: const Icon(Icons.error, size: 20, color: Colors.red),
                );
              },
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
