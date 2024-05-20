// ignore_for_file: file_names
import 'package:banhang/screens/login3.dart';
import 'package:banhang/screens/logout1.dart';
import 'package:banhang/screens/menu.dart';
import 'package:flutter/material.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Menu()),
            );
            },
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.login)),
              Tab(icon: Icon(Icons.read_more)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Login3(),
            Register1(),
          ],
        ),
      ),
    );
  }
}

