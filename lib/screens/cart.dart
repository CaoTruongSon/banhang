import 'package:banhang/components/comshop.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor:  const Color.fromARGB(255, 255, 255, 255)),
      home: Scaffold(
        body: Center(
          child: ExamplePara(),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class ExamplePara extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(// tạo một cửa sổ cuộn duy nhất 
      child: Column(
        children: [
          for (final location in locations)
             LocationListItem(
              image: location.image,
              name: location.name,
              country: location.place,
              loggy: location.loggy,
              price: location.price,
            ),
        ],
      ),
    );
  }
}
