import 'package:banhang/screens/login2.dart';
import 'package:flutter/material.dart';

class Login3 extends StatelessWidget {
  const Login3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Login2()),
            );
          },
          child: const Text('Đăng nhập'),
        ),
      ),
    );
  }
}
