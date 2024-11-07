import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileSection extends StatefulWidget {
  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  File? _profileImage;
  String _username = "John Doe";

  final TextEditingController _nameController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  void _editName() {
    _nameController.text = _username;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Name"),
        content: TextField(
          controller: _nameController,
          decoration: InputDecoration(hintText: "Enter new name"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _username = _nameController.text;
              });
              Navigator.of(context).pop();
            },
            child: Text("Save"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[100],
      child: Row(
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 30,
              backgroundImage:
                  _profileImage != null ? FileImage(_profileImage!) : null,
              child: _profileImage == null
                  ? Icon(Icons.person, size: 30, color: Colors.grey[300])
                  : null,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _username,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'View Profile',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: _editName,
          ),
        ],
      ),
    );
  }
}
