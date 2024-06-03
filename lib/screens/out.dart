import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Out extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            SystemNavigator.pop(); // Thoát ứng dụng
          },
          child: Text('Thoát ứng dụng'),
        ),
      ),
    );
  }
}
