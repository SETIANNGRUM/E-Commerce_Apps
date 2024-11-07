import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

// Import necessary screens
import 'package:tubesnew/features/customer_support/customer_support_screen.dart';
import 'package:tubesnew/features/notifications/notifications_screen.dart';
import 'package:tubesnew/features/orders/orders_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  File? _profileImage;
  String _username = "John Doe";
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );

      if (pickedImage != null) {
        final directory = await getApplicationDocumentsDirectory();
        final fileName = 'profile_image.png';
        final imagePath = path.join(directory.path, fileName);

        final savedImage = await File(pickedImage.path).copy(imagePath);

        setState(() {
          _profileImage = savedImage;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to pick image. Please check permissions."),
          backgroundColor: Colors.red,
        ),
      );
      debugPrint("Error picking image: $e");
    }
  }

  void _editName() {
    _nameController.text = _username;
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        title: const Text("Edit Name"),
        content: TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            hintText: "Enter new name",
            border: OutlineInputBorder(),
          ),
          maxLength: 30,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_nameController.text.trim().isNotEmpty) {
                setState(() {
                  _username = _nameController.text.trim();
                });
                Navigator.of(dialogContext).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Name cannot be empty"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text("Save"),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            _buildProfileSection(),
            const SizedBox(height: 20),

            // Orders and Notifications Section
            _buildOrdersAndNotificationsSection(),

            // Rewards and Promotions Section
            _buildRewardsAndPromotionsSection(),

            // Help Section
            _buildHelpSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return GestureDetector(
      onTap: _pickImage,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: _profileImage != null
              ? FileImage(_profileImage!)
              : const AssetImage('assets/cupcake.png') as ImageProvider,
          child: _profileImage == null
              ? const Icon(Icons.person, size: 30, color: Colors.grey)
              : null,
        ),
        title: Text(
          _username,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text('View Profile'),
        trailing: IconButton(
          icon: const Icon(Icons.edit, color: Colors.black),
          onPressed: _editName,
        ),
      ),
    );
  }

  Widget _buildOrdersAndNotificationsSection() {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.shopping_bag, color: Colors.black),
          title: const Text('Your orders', style: TextStyle(fontSize: 16)),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrdersScreen()),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.notifications, color: Colors.black),
          title: const Text('Notifications', style: TextStyle(fontSize: 16)),
          trailing: const Icon(Icons.circle, size: 10, color: Colors.red),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationsScreen()),
          ),
        ),
      ],
    );
  }

  Widget _buildRewardsAndPromotionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          'Rewards & Promotions',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ListTile(
          leading: const Icon(Icons.monetization_on, color: Colors.black),
          title: const Text('Earn \$280', style: TextStyle(fontSize: 16)),
          subtitle:
              const Text('Was: \$140', style: TextStyle(color: Colors.red)),
        ),
        const ListTile(
          leading: Icon(Icons.account_balance_wallet, color: Colors.black),
          title: Text('Wish Cash: US\$0.00', style: TextStyle(fontSize: 16)),
        ),
        const ListTile(
          leading: Icon(Icons.card_giftcard, color: Colors.black),
          title: Text('Rewards: 100 Points', style: TextStyle(fontSize: 16)),
        ),
        const ListTile(
          leading: Icon(Icons.calendar_today, color: Colors.black),
          title: Text('Daily Login Bonus', style: TextStyle(fontSize: 16)),
        ),
        const ListTile(
          leading: Icon(Icons.local_offer, color: Colors.black),
          title: Text('Apply Promo', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  Widget _buildHelpSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          'Help',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ListTile(
          leading: const Icon(Icons.support_agent, color: Colors.black),
          title: const Text('Customer Support', style: TextStyle(fontSize: 16)),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CustomerSupportScreen()),
          ),
        ),
        const ListTile(
          leading: Icon(Icons.help_outline, color: Colors.black),
          title: Text('Frequently Asked Questions',
              style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
