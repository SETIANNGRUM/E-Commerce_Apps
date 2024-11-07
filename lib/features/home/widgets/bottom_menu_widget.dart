import 'package:flutter/material.dart';
import 'package:tubesnew/features/home/home_screen.dart'; // Path untuk HomeScreen
import 'package:tubesnew/features/voucher/voucher_screen.dart'; // Path untuk VoucherScreen
import 'package:tubesnew/features/wallet/wallet_screen.dart';
// ignore: unused_import
import 'package:tubesnew/features/settings/settings_screen.dart';
import 'package:tubesnew/settings/settings_screen.dart'; // Path untuk SettingsScreen

class BottomMenuWidget extends StatefulWidget {
  const BottomMenuWidget({super.key});

  @override
  _BottomMenuWidgetState createState() => _BottomMenuWidgetState();
}

class _BottomMenuWidgetState extends State<BottomMenuWidget> {
  int _currentIndex = 0; // Indeks saat ini untuk BottomNavigationBar

  // Daftar screens yang akan ditampilkan
  final List<Widget> _screens = [
    HomeScreen(), // Pastikan HomeScreen terdefinisi
    VoucherScreen(), // Pastikan VoucherScreen terdefinisi
    WalletScreen(), // Pastikan WalletScreen terdefinisi
    SettingsScreen(), // Pastikan SettingsScreen terdefinisi
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Perbarui indeks saat ini
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Menampilkan layar berdasarkan indeks
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Voucher'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
