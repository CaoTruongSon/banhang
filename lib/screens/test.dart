import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Đăng kí'),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextFormField(
              controller: confirmPassController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Xác nhận mật khẩu',
                suffixIcon: Padding(
                  padding: EdgeInsets.only(
                      right:
                          10.0), // Điều chỉnh khoảng cách từ icon đến biên phải của trường
                  child: Icon(
                    Icons.password,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  //null or rỗng sẽ xuất
                  return 'Không được để trống';
                } else if (value != passController.text) {
                  return 'Mật khẩu không khớp';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Gmail', // khi nhập text sẽ biến mất
                suffixIcon: Padding(
                  padding: EdgeInsets.only(
                      right:
                          10.0), // Điều chỉnh khoảng cách từ icon đến biên phải của trường
                  child: Icon(
                    Icons.email,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  //null or rỗng sẽ xuất
                  return 'Gmail không được để trống';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(
                    r'[0-9]')), // Chấp nhận chỉ số và không chấp nhận các ký tự khác
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Số điện thoại', // khi nhập text sẽ biến mất
                suffixIcon: Padding(
                  padding: EdgeInsets.only(
                      right:
                          10.0), // Điều chỉnh khoảng cách từ icon đến biên phải của trường
                  child: Icon(
                    Icons.phone,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Số điện thoại không được để trống';
                } else if (!isValidPhoneNumber(value)) {
                  return 'Số điện thoại không hợp lệ';
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
                        registerUser();
                      }
                    },
                    child: const Text('Đăng kí'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Hàm kiểm tra định dạng số điện thoại
  bool isValidPhoneNumber(String input) {
    // Bạn có thể thay đổi logic kiểm tra định dạng số điện thoại tùy thuộc vào yêu cầu của bạn
    final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');
    return phoneRegex.hasMatch(input);
  }

  // void checkDuplicateAccountAndPhone() async {

  // }

  void registerUser() async {
    try {
      final String email = emailController.text.trim();
      final String password = passController.text.trim();
      final String name = nameController.text.trim();
      final String phone = phoneController.text.trim();

      // Tạo tài khoản người dùng mới với Firebase
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Lấy ID của người dùng được tạo
      final String userId = userCredential.user!.uid;

      // Lưu thông tin người dùng vào Realtime Database (Firebase)
      await FirebaseDatabase.instance
          .reference()
          .child('users')
          .child(userId)
          .set({
        'name': name,
        'phone': phone,
      });

      // Đăng kí thành công, bạn có thể thực hiện hành động tiếp theo tại đây (ví dụ: chuyển hướng đến trang khác)
    } catch (error) {
      // Xử lý lỗi nếu có
      print('Đăng ký thất bại: $error');
      // Hiển thị thông báo lỗi cho người dùng nếu cần
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng ký thất bại: $error')),
      );
    }
  }
}
