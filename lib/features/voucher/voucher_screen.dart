import 'package:flutter/material.dart';

class VoucherScreen extends StatelessWidget {
  final List<Map<String, dynamic>> vouchers = [
    {
      'title': 'Discount 20% on Summer Clothing Collection',
      'description':
          'Get 20% off on summer clothing items. Min Purchase 3 items. Max discount: 100k. Cannot be combined with other promotional offers.',
      'expiry': 'Expires 30 Nov 2024',
      'available': '5x Vouchers Available'
    },
    {
      'title': 'Buy 2 Get 1 Free on Casual Shirts',
      'description':
          'Buy 2 casual shirts and get 1 for free. Cannot be used with other promotions. Valid for select items only.',
      'expiry': 'Expires 15 Dec 2024',
      'available': '3x Vouchers Available'
    },
    {
      'title': '30% Off on Winter Coats',
      'description':
          'Enjoy 30% off on all winter coats. Max discount: 150k. Min Purchase 1 coat. Offer valid until stocks last.',
      'expiry': 'Expires 10 Dec 2024',
      'available': '4x Vouchers Available'
    },
    {
      'title': 'Discount 25% on Formal Wear',
      'description':
          'Get 25% off on formal wear. Includes suits, blazers, and trousers. Max discount of 200k.',
      'expiry': 'Expires 5 Dec 2024',
      'available': '2x Vouchers Available'
    },
    {
      'title': '15% Off on Sportswear',
      'description':
          'Get 15% off on all sportswear. Valid on items such as jerseys, shorts, and tracksuits.',
      'expiry': 'Expires 20 Dec 2024',
      'available': '6x Vouchers Available'
    },
  ];

  VoucherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.all(16.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voucher & Deals'),
        backgroundColor: Colors.blueAccent, // Ganti sesuai preferensi
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: edgeInsets,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search a Voucher',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Active Deals',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDealCard(
                    '10', 'Available Vouchers', Colors.blue, '4 Expiring Soon'),
                _buildDealCard(
                    '13', 'Event Subscriptions', Colors.red, '10 Ongoing Soon'),
              ],
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: const Icon(Icons.local_offer, color: Colors.blue),
                title: const Text('Promo Code? Enter Promo Here.'),
                trailing: const Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.grey),
                onTap: () {
                  // Penanganan untuk memasukkan kode promo bisa ditambahkan di sini
                },
              ),
            ),
            const SizedBox(height: 20),
            for (var voucher in vouchers) _buildVoucherCard(voucher),
          ],
        ),
      ),
    );
  }

  Widget _buildDealCard(
      String count, String label, Color color, String subLabel) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(count,
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 4),
            Text(label,
                style: const TextStyle(fontSize: 14, color: Colors.black)),
            const SizedBox(height: 4),
            Text(subLabel, style: TextStyle(fontSize: 12, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildVoucherCard(Map<String, dynamic> voucher) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(voucher['title'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(voucher['description'],
                style: TextStyle(color: Colors.grey[700])),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.event_available,
                        color: Colors.blue, size: 16),
                    const SizedBox(width: 4),
                    Text(voucher['expiry'],
                        style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.confirmation_number,
                        color: Colors.blue, size: 16),
                    const SizedBox(width: 4),
                    Text(voucher['available'],
                        style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logika untuk melihat detail voucher
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Center(child: Text('View Voucher')),
            ),
          ],
        ),
      ),
    );
  }
}
