import 'package:banhang/components/combuy.dart';
import 'package:banhang/containers/conbuy.dart';
import 'package:banhang/screens/cart.dart';
import 'package:flutter/material.dart';

class Buy extends StatefulWidget {
  final String loggy;
  final String name;
  final String image;
  final String place;
  final String price;

  const Buy({
    Key? key,
    required this.loggy,
    required this.name,
    required this.image,
    required this.place,
    required this.price,
  }) : super(key: key);
  @override
  State<Buy> createState() => _Buy();
  void navigateToCart(BuildContext context) {
  items.add({
    'name': name,
    'image': image,
    'place': place,
    'price': price,
    'loggy': loggy,
  });

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Cart(items: items),
    ),
  );
}


}

class _Buy extends State<Buy> {
  int number = 0;
  int newprice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Mua hàng'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, //cách đều các phần tử , trái phải thì không
          children: [
            Image7(
              image: widget.image,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextStart(
                name: widget.name,
                place: widget.place,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Counter(
                price: widget.price,
                onValueChanged: (number1, totalPrice1) {
                  setState(() {
                    number = number1;
                    newprice = totalPrice1;
                  });
                },
              ),
            ),
            ButtonThree(
              number: number,
              newprice: newprice, 
              name: widget.name, 
              place: widget.place, 
              image: widget.image,
              onTapCallback: () {
              widget.navigateToCart(context);
              },
            ),
            Text7(
              text7: widget.loggy,
            ),
          ],
        ), //
      ),
    );
  }
}

class TextStart extends StatelessWidget {
  final String name;
  final String place;
  const TextStart({required this.name, required this.place, super.key});

  @override
  Widget build(BuildContext context) {
    return TextStartCom(
      name: name,
      location: place,
    );
  }
}

// ignore: use_key_in_widget_constructors
class ButtonThree extends StatelessWidget {
  final int number;
  final int newprice;
  final String name;
  final String place;
  final String image;
  final VoidCallback onTapCallback;

  const ButtonThree({
    required this.number,
    required this.newprice,
    super.key, 
    required this.name, 
    required this.place, 
    required this.image,
    required this.onTapCallback,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment
          .spaceEvenly, // các phần tử cách đều nhau ví dụ 3 phần tử thì 3 phần tử cách đều và bên cạnh trái,phải cũng cách đều các phần tử ,,row: ngang, column: dọc
      children: [
        Button7(
            color: Theme.of(context).primaryColor,
            icon: Icons.add,
            label: 'BUY',
            ontap: onTapCallback,
            ),
        Button7(
          color: Theme.of(context).primaryColor,
          icon: Icons.share,
          label: 'SHARE',
          ontap: () {},
        ),
        Button7(
          color: Theme.of(context).primaryColor,
          icon: Icons.arrow_back,
          label: 'BACK',
          ontap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
