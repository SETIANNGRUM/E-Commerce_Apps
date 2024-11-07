import 'package:flutter/material.dart';

class ProfileController with ChangeNotifier {
  String _username = "John Doe";
  String get username => _username;

  void updateUsername(String newUsername) {
    _username = newUsername;
    notifyListeners();
  }

  // Tambahkan metode lain untuk pengambilan gambar atau update profil ke server
}
