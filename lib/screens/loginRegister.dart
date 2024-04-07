// ignore_for_file: file_names

import 'package:banhang/screens/login2.dart';
import 'package:banhang/screens/test.dart';

import 'package:flutter/material.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.login)),
              Tab(icon: Icon(Icons.read_more)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Login2(),
            Register(),
          ],
        ),
      ),
    );
  }
}

