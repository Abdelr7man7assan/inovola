

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:flutter/material.dart';

import '../widgets/button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _image = File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Name"),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Profile Image"),
            const SizedBox(height: 8),
            Row(
              children: [
                _image != null
                    ? CircleAvatar(backgroundImage: FileImage(_image!), radius: 30)
                    : const CircleAvatar(child: Icon(Icons.person), radius: 30),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Choose Image'),
                )
              ],
            ),
            const SizedBox(height: 16),
            const Text("Email"),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Password"),
            const SizedBox(height: 8),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),

            AppButton(text:  'Sign Up', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
