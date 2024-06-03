import 'package:banhang/components/comshop.dart';
import 'package:banhang/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

List<Map<String, String>> items = [];

class Cart extends StatelessWidget {
  final List<Map<String, String>> items;
  final String? userName;
  final String? phone;

  const Cart({
    Key? key,
    required this.items,
    required this.userName,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ExamplePara(
          userName: userName,
          phone: phone,
          items: items, // Truyền danh sách items xuống ExamplePara
        ), // Truyền userName và phone xuống ExamplePara
      ),
    );
  }
}

class ExamplePara extends StatefulWidget {
  final String? userName;
  final String? phone;
  final List<Map<String, String>> items; // Nhận danh sách items từ Cart

  const ExamplePara({Key? key, this.userName, this.phone, required this.items})
      : super(key: key);

  @override
  _ExampleParaState createState() => _ExampleParaState();
}

class _ExampleParaState extends State<ExamplePara> {
  final TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  void _saveOrderToFirebase(
      String userName, String phone, String address) async {
    DatabaseReference ordersRef =
        FirebaseDatabase.instance.ref().child("orders");

    List<String> itemNames = widget.items.map((item) => item['name']!).toList();
    String orderTime = DateTime.now().toString(); // Lấy thời gian hiện tại

    // Create a new order
    DatabaseReference newOrderRef = ordersRef.push();
    await newOrderRef.set({
      'userName': userName,
      'phone': phone,
      'address': address,
      'items': itemNames,
      'orderTime': orderTime, // Thêm thời gian vào đơn hàng
    });
  }

  void _clearItemsAndGoToMenu() {
    setState(() {
      items.clear(); // Làm trống danh sách items
    });
    Navigator.of(context)
        .popUntil((route) => route.isFirst); // Quay lại trang đầu tiên
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final item in widget.items)
            LocationListItem(
              image: item['image']!,
              name: item['name']!,
              country: item['place']!,
              loggy: item['loggy']!,
              price: item['price']!,
              userName: widget.userName,
              phone: widget.phone,
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập địa chỉ của bạn',
                labelText: 'Địa chỉ',
                labelStyle: TextStyle(
                    color: Colors
                        .black), // Thay đổi màu của chữ label thành màu đen
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Quay lại trang trước
                },
                child: Text('Back'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  String address = addressController.text;
                  print('UserName: ${widget.userName}'); // In ra username
                  print('Phone: ${widget.phone}'); // In ra phone
                  print('Address: $address'); // In ra address

                  if (widget.userName != null &&
                      widget.phone != null &&
                      address.isNotEmpty) {
                    _saveOrderToFirebase(widget.userName!, widget.phone!,
                        address); // Lưu đơn hàng vào Firebase
                  }

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Cảm ơn quý khách đã mua hàng'),
                        content: Text('Địa chỉ giao hàng: $address'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              items
                                  .clear(); // Xóa tất cả các mục trong danh sách
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Menu(
                                    userName: widget.userName,
                                    phone: widget.phone,
                                  ),
                                ),
                              );
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
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () =>
                    _clearItemsAndGoToMenu(), // Gọi hàm _clearItemsAndGoToMenu khi ấn nút
                child: Text('Clear'),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
