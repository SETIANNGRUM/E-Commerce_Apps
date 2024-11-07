// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubesnew/features/home/cart_provider.dart'; // Provider untuk CartProvider
import 'package:tubesnew/features/home/widgets/cart_model.dart'; // Import CartModel
import 'package:tubesnew/features/home/home_screen.dart'; // Path untuk HomeScreen
import 'package:tubesnew/features/voucher/voucher_screen.dart'; // Path untuk VoucherScreen
import 'package:tubesnew/features/wallet/wallet_screen.dart'; // Path untuk WalletScreen
import 'package:tubesnew/features/settings/settings_screen.dart';
import 'package:tubesnew/settings/settings_screen.dart'; // Path untuk SettingsScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(), // Menyediakan CartProvider
        ),
        ChangeNotifierProvider(
          create: (_) => CartModel(), // Menyediakan CartModel
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Daftar screens
  final List<Widget> _screens = [
    HomeScreen(), // Ganti dari DashboardPage ke HomeScreen
    VoucherScreen(), // Voucher Screen
    WalletScreen(), // Wallet Screen
    SettingsScreen(), // Settings Screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
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
