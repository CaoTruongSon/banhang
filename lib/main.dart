import 'package:banhang/screens/menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAhyTDNKU-yTt8XfO9S-wJBh-KuM-5hOhY',
        appId: '1:189682818219:android:3ef0b5921ccba039abebee',
        messagingSenderId: '189682818219',
        projectId: 'test-ae802',
        authDomain: 'test-ae802.firebaseapp.com',
        databaseURL: 'https://test-ae802-default-rtdb.firebaseio.com/',
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
