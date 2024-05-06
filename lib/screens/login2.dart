import 'package:banhang/screens/shop.dart';
import 'package:flutter/material.dart';

class Login2 extends StatelessWidget {
  const Login2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Đăng nhập'),
          ),
        ),
        body: const SingleChildScrollView(
          child: MyCustom(),
        ),
      ),
    );
  }
}

class MyCustom extends StatefulWidget {
  const MyCustom({super.key});

  @override
  State<MyCustom> createState() => _MyCustom();
}

class _MyCustom extends State<MyCustom> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool accountError = false;
  bool phoneError = false;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode
          .onUserInteraction, // Tự động kiểm tra lỗi sau mỗi lần người dùng tương tác
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tài khoản', // khi nhập text sẽ biến mất
                suffixIcon: Padding(
                  padding: EdgeInsets.only(
                      right:
                          10.0), // Điều chỉnh khoảng cách từ icon đến biên phải của trường
                  child: Icon(
                    Icons.account_box,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  //null or rỗng sẽ xuất
                  return 'tài khoản không được để trống';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextFormField(
              controller: passController,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Mật khẩu', // khi nhập text sẽ biến mất
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                      right:
                          4.0), // Điều chỉnh khoảng cách từ icon đến biên phải của trường
                  child: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  //null or rỗng sẽ xuất
                  return 'mật khẩu không được để trống';
                } else if (value.length < 6) {
                  return 'Mật khẩu phải chứa ít nhất 6 ký tự';
                }
                return null;
              },
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // dùng thuộc tính này ms dùng dc center bao bọc row
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Shop()),
                        );
                      }
                    },
                    child: const Text('Đăng nhập'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
