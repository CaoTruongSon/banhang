import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  final String? userName;
  final String? pass;
  const ChangePassword({
    Key? key,
    this.userName,
    this.pass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Current Password',
                hintText: 'Enter your current password',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'New Password',
                hintText: 'Enter your new password',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirm New Password',
                hintText: 'Confirm your new password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement password change logic here
              },
              child: Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}

