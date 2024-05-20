import 'package:banhang/screens/loginRegister.dart';
import 'package:banhang/screens/menu.dart';
import 'package:firebase_database/firebase_database.dart';
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
  State<MyCustom> createState() => _MyCustomState();
}

class _MyCustomState extends State<MyCustom> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tài khoản',
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.account_box,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tài khoản không được để trống';
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
                hintText: 'Mật khẩu',
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
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
                  return 'Mật khẩu không được để trống';
                } else if (value.length < 6) {
                  return 'Mật khẩu phải chứa ít nhất 6 ký tự';
                }
                return null;
              },
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login();
                      }
                    },
                    child: const Text('Đăng nhập'),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text('Back'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _login() async {
  DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users");
  try {
    DatabaseEvent snapshot = await userRef
        .orderByChild("name")
        .equalTo(nameController.text)
        .once();

    if (snapshot.snapshot.value != null) {
      Map<dynamic, dynamic> users = snapshot.snapshot.value as Map<dynamic, dynamic>;
      String? userKey;
      String? userPhone;

      users.forEach((key, value) {
        if (value["name"] == nameController.text) {
          userKey = key;
          userPhone = value["phone"]; // Lấy số điện thoại
        }
      });

      if (userKey != null) {
        DatabaseEvent snapshot1 = await userRef
            .orderByChild("pass")
            .equalTo(passController.text)
            .once();
        if (snapshot1.snapshot.value != null) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Menu(userName: nameController.text, phone: userPhone ?? '')),
          );
        } else {
          // Hiển thị thông báo khi mật khẩu không đúng
          _showError('Sai mật khẩu');
        }
      }
    } else {
      // Hiển thị thông báo khi tài khoản không tồn tại
      _showError('Tài khoản không tồn tại');
    }
  } catch (e) {
    // Xử lý lỗi khi truy xuất dữ liệu
    _showError('Đã xảy ra lỗi khi đăng nhập');
  }
}

void _showError(String message) {
  final snackBar = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {
        // Đóng thông báo khi người dùng nhấn vào nút OK
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

}
