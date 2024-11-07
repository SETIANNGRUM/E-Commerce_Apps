import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metode Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Rekomendasi', style: TextStyle(fontSize: 18)),
              Row(
                children: [
                  Image.asset('assets/images/dana_logo.png',
                      height: 100), // Tinggi ikon DANA diperbesar
                  const SizedBox(width: 10),
                  const Text('DANA', style: TextStyle(fontSize: 18)),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Virtual Account', style: TextStyle(fontSize: 18)),
              ListTile(
                leading: Image.asset('assets/images/mandiri_logo.png',
                    height: 100), // Tinggi ikon Mandiri diperbesar
                title: const Text('Virtual Account Mandiri',
                    style: TextStyle(fontSize: 18)),
              ),
              ListTile(
                leading: Image.asset('assets/images/bni_logo.png',
                    height: 100), // Tinggi ikon BNI diperbesar
                title: const Text('Virtual Account BNI',
                    style: TextStyle(fontSize: 18)),
              ),
              ListTile(
                leading: Image.asset('assets/images/permata_logo.png',
                    height: 80), // Tinggi ikon Permata diperbesar
                title: const Text('Virtual Account Permata',
                    style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),
              const Text('Kartu Kredit / Debit',
                  style: TextStyle(fontSize: 18)),
              ListTile(
                leading: Image.asset('assets/images/kartu_kredit_logo.png',
                    height: 80), // Tinggi ikon Kartu Kredit diperbesar
                title:
                    const Text('Kartu Kredit', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),
              const Text('Gerai', style: TextStyle(fontSize: 18)),
              ListTile(
                leading: Image.asset('assets/images/gopay_logo.png',
                    height: 80), // Tinggi ikon GoPay diperbesar
                title: const Text('GoPay', style: TextStyle(fontSize: 18)),
              ),
              ListTile(
                leading: Image.asset('assets/images/indomaret_logo.png',
                    height: 80), // Tinggi ikon Indomaret diperbesar
                title: const Text('Indomaret', style: TextStyle(fontSize: 18)),
              ),
              ListTile(
                leading: Image.asset('assets/images/alfamart_logo.png',
                    height: 80), // Tinggi ikon Alfamart diperbesar
                title: const Text('Alfamart & Alfamidi',
                    style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
