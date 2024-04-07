import 'package:banhang/components/comshop.dart';
import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

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



const locations = [
  Location(
    name: 'Mount Rushmore', 
    place: 'U.S.A', 
    image: 'assets/mon1.jpg',
    price: '20000',
    loggy: 'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578meters above sea level, it is one of the largerAlpine Lakes. A gondola ride from Kandersteg,followed by a half-hour walk through pasturesand pine forest, leads you to the lake, which awarms to 20 degrees Celsius in the summer.Activities enjoyed here include rowing, andriding the summer toboggan run.',
    ),
  Location(
    name: 'Gardens By The Bay', 
    place: 'Singapore', 
    image: 'assets/mon2.jpeg',
    price: '20000',
    loggy: 'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578meters above sea level, it is one of the largerAlpine Lakes. A gondola ride from Kandersteg,followed by a half-hour walk through pasturesand pine forest, leads you to the lake, which awarms to 20 degrees Celsius in the summer.Activities enjoyed here include rowing, andriding the summer toboggan run.',
    ),
  Location(
    name: 'Machu Picchu', 
    place: 'Peru', 
    image: 'assets/mon3.jpg',
    price: '20000',
    loggy: 'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578meters above sea level, it is one of the largerAlpine Lakes. A gondola ride from Kandersteg,followed by a half-hour walk through pasturesand pine forest, leads you to the lake, which awarms to 20 degrees Celsius in the summer.Activities enjoyed here include rowing, andriding the summer toboggan run.',
    ),
  Location(
    name: 'Vitznau', 
    place: 'Switzerland', 
    image: 'assets/mon4.jpg',
    price: '20000',
    loggy: 'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578meters above sea level, it is one of the largerAlpine Lakes. A gondola ride from Kandersteg,followed by a half-hour walk through pasturesand pine forest, leads you to the lake, which awarms to 20 degrees Celsius in the summer.Activities enjoyed here include rowing, andriding the summer toboggan run.',
    ),
  Location(
    name: 'Bali', 
    place: 'Indonesia', 
    image: 'assets/mon5.jpg',
    price: '20000',
    loggy: 'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578meters above sea level, it is one of the largerAlpine Lakes. A gondola ride from Kandersteg,followed by a half-hour walk through pasturesand pine forest, leads you to the lake, which awarms to 20 degrees Celsius in the summer.Activities enjoyed here include rowing, andriding the summer toboggan run.',
    ),
  Location(
    name: 'Mexico City', 
    place: 'Mexico', 
    image: 'assets/mon6.jpg',
    price: '20000',
    loggy: 'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578meters above sea level, it is one of the largerAlpine Lakes. A gondola ride from Kandersteg,followed by a half-hour walk through pasturesand pine forest, leads you to the lake, which awarms to 20 degrees Celsius in the summer.Activities enjoyed here include rowing, andriding the summer toboggan run.',
    ),
  Location(
    name: 'Cairo', 
    place: 'Egypt', 
    image: 'assets/mon7.jpg',
    price: '20000',
    loggy: 'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578meters above sea level, it is one of the largerAlpine Lakes. A gondola ride from Kandersteg,followed by a half-hour walk through pasturesand pine forest, leads you to the lake, which awarms to 20 degrees Celsius in the summer.Activities enjoyed here include rowing, andriding the summer toboggan run.',
    ),
];
