import 'package:banhang/components/combuy.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final String price;
  final void Function(int,int) onValueChanged;
  const Counter({required this.price, required this.onValueChanged, Key? key})
      : super(key: key);

  @override
  State<Counter> createState() => _Counter();
}

class _Counter extends State<Counter> {
  int get totalPrice => int.parse(widget.price) * number;
  int number = 1;
  void _decreate() {
    setState(() {
      if (number > 0) {
        --number;
        widget.onValueChanged(number, totalPrice);
      }
    });
  }

  void _increate() {
    setState(() {
      ++number;
      widget.onValueChanged(number, totalPrice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CounterClick(
          onPressed: _decreate,
          nameText: 'Giảm',
        ),
        CounterNumber(
          count: number,
        ),
        CounterClick(
          onPressed: _increate,
          nameText: 'Tăng',
        ),
        Row(
          children:[
          CounterNumber(
          count: totalPrice,
          ),
          const Text(
            'VND',
            style:TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
