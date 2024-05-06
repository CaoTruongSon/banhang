import 'package:banhang/screens/cart.dart';
import 'package:banhang/screens/loginRegister.dart';
import 'package:banhang/screens/search.dart';
import 'package:banhang/screens/shop.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final String? userName; // Thêm thuộc tính userName để lưu trữ tên người dùng

  const Menu({Key? key, this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHomePage(
      isLoggedIn: userName != null, // Kiểm tra xem có tên người dùng hay không
      title: 'Shop CTS',
      items: [],
      userName: userName, // Truyền tên người dùng vào trang MyHomePage
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final List<Map<String, String>> items;
  final bool isLoggedIn;
  final String? userName; // Thêm thuộc tính userName

  const MyHomePage({
    required this.title,
    required this.items,
    required this.isLoggedIn,
    this.userName, // Cập nhật constructor để nhận giá trị userName
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePage();
}


class _MyHomePage extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Shop(),
    SearchBar1(),
    const Cart(items: []),
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
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(228, 0, 0, 0),
        actions: [
  if (!widget.isLoggedIn && widget.userName == null) // Nếu chưa đăng nhập và không có tên người dùng
    Padding(
      padding: const EdgeInsets.only(right: 16),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Login()), // Điều hướng đến trang đăng nhập
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        child: const Text('Đăng nhập'),
      ),
    ),
  if (widget.isLoggedIn || widget.userName != null) ...[
    // Nếu đã đăng nhập hoặc có tên người dùng
    Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Text(
         widget.userName ?? 'Tên Tài Khoản', // Hiển thị tên người dùng hoặc 'Tên Tài Khoản' nếu không có
        style: const TextStyle(fontSize: 16),
      ),
    ),
    PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'change_password') {
          // Thực hiện thay đổi mật khẩu
        } else if (value == 'logout') {
          // Thực hiện đăng xuất
        }
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<String>(
          value: 'change_password',
          child: Text('Đổi mật khẩu'),
        ),
        const PopupMenuItem<String>(
          value: 'logout',
          child: Text('Thoát'),
        ),
      ],
    ),
  ],
],

      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
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
