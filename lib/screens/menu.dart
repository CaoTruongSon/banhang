import 'package:banhang/screens/cart.dart';
import 'package:banhang/screens/loginRegister.dart';
import 'package:banhang/screens/search.dart';
import 'package:banhang/screens/shop.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final String? userName;
  final String? phone;

  const Menu({Key? key, this.userName, this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Menu - userName: $userName'); // In ra userName trong Menu
    print('phone: $phone');
    return MyHomePage(
      isLoggedIn: userName != null, // Kiểm tra xem có tên người dùng hay không
      title: 'Shop CTS',
      items: [],
      initialUserName: userName, // Truyền tên người dùng vào trang MyHomePage
      phone: phone,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final List<Map<String, String>> items;
  final bool isLoggedIn;
  final String? initialUserName; // Đổi tên thuộc tính này
  final String? phone;

  const MyHomePage({
    required this.title,
    required this.items,
    required this.isLoggedIn,
    this.initialUserName,
    this.phone,
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String? userName;
  String? phone;

  @override
  void initState() {
    super.initState();
    userName = widget.initialUserName;
    phone = widget.phone;
    print(
        'MyHomePage - userName: $userName'); // In ra userName trong MyHomePage
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      Shop(userName: userName, phone: phone,),
      SearchBar1(userName: userName, phone: phone,),
      Cart(
        items: widget.items,
        userName: userName,
        phone: phone,
      ), // Truyền userName xuống Cart
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(228, 0, 0, 0),
        actions: [
          if (!widget.isLoggedIn && userName == null)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                  if (result != null && result is String) {
                    setState(() {
                      // Cập nhật userName khi quay lại từ màn hình đăng nhập
                      userName = result;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                ),
                child: const Text('Đăng nhập'),
              ),
            ),
          if (widget.isLoggedIn || userName != null) ...[
            Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Text(
                'Xin chào, $userName',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
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
