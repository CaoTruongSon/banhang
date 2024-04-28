import 'package:banhang/screens/cart.dart';
import 'package:banhang/screens/loginRegister.dart';
import 'package:banhang/screens/shop.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: 'Shop CTS',
      items: [],);
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final List<Map<String, String>> items; // Thêm tham số items vào đây
  const MyHomePage({required this.title, required this.items, Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    //nơi lưu các nội dung trong menu
    Shop(),
    Text('tìm kiếm'),
    Cart(items:[],),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        iconTheme:
            const IconThemeData(color: Colors.white), // Đặt màu cho biểu tượng
        backgroundColor: const Color.fromARGB(228, 0, 0, 0),
        actions: [
          //đặt icon bên phải
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Image.network(
              'assets/private.png',
              width: 20,
              height: 20,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 0), // Điều chỉnh khoảng cách xung quanh chữ
                minimumSize: const Size(0, 0), // Đặt kích thước tối thiểu
                maximumSize: const Size(double.infinity, 40), // Đặt chiều cao tối đa
              ),
              child: const Text('Đăng nhập'),
            ),
          ),
        ],
      ),
      body: Center(
        // nội dung từng page trong menu
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        //menu
        child: ListView(
          padding: EdgeInsets.zero, //không có lề (padding) nào được áp dụng
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text('Shop'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Tìm kiếm'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Giỏ hàng'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
