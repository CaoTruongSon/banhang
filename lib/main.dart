import 'package:banhang/screens/menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBJzkPs4rQwjc5QrOTKCK9UWUEe41dM4Zk',
        appId: '1:478387191285:android:531f93f10e793fc0c3b4bc',
        messagingSenderId: '478387191285',
        projectId: 'banhangapp-a4718',
        // authDomain: 'banhangapp-a4718.firebaseapp.com',
        databaseURL: 'https://banhangapp-a4718-default-rtdb.firebaseio.com',
      ),
    );

  runApp(
    const MaterialApp(
      home: SafeArea(
        child: Menu(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
