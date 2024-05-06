import 'package:banhang/components/comshop.dart';
import 'package:flutter/material.dart';

List<Map<String, String>> items = [];

class Cart extends StatelessWidget {
  final List<Map<String, String>> items;

  const Cart({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
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
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final item in items)
            LocationListItem(
              image: item['image']!,
              name: item['name']!,
              country: item['place']!,
              loggy: item['loggy']!,
              price: item['price']!,
            ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Cảm ơn quý khách đã mua hàng'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          items.clear(); // Xóa tất cả các mục trong danh sách
                          Navigator.of(context).popUntil((route) => route.isFirst);
                        },
                        child: Text('Đóng'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Buy All'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
