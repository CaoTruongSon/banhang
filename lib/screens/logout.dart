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
  bool emailError = false;
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

  void checkDuplicateAccountAndPhone() async {
    // ignore: deprecated_member_use
    DatabaseReference userRef =
        // ignore: deprecated_member_use
        FirebaseDatabase.instance.reference().child("users");
    try {
      DatabaseEvent snapshot = await userRef
          .orderByChild("name")
          .equalTo(nameController.text)
          .once(); //không có dữ liệu, giá trị này cũng sẽ là null
      // ignore: unnecessary_null_comparison
      if (snapshot != null && snapshot.snapshot.value != null) {
        // Tài khoản đã tồn tại
        setState(() {
          accountError = true;
        });
      } else {
        // Kiểm tra số điện thoại
        DatabaseEvent phoneSnapshot = await userRef
            .orderByChild("phone")
            .equalTo(phoneController.text)
            .once();
        // ignore: unnecessary_null_comparison
        if (phoneSnapshot != null && phoneSnapshot.snapshot.value != null) {
          // Số điện thoại đã tồn tại
          setState(() {
            phoneError = true;
          });
        } else {
          registerUser();
          return;
        }
      }
    } catch (error) {
      // ignore: avoid_print
      print("Lỗi: $error");
    }
    // Hiển thị Snackbar phù hợp dựa trên tình trạng lỗi
    if (accountError) {
      // Nếu chỉ trùng tài khoản
      final snackBar = SnackBar(
        content: const Text('Tài khoản đã tồn tại'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      accountError = false;
      phoneError = false;
      emailError = false;
    } else if (phoneError) {
      // Nếu chỉ trùng số điện thoại
      final snackBar = SnackBar(
        content: const Text('Số điện thoại đã tồn tại'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      accountError = false;
      phoneError = false;
      emailError = false;
    }
    // else if (emailError) {
    //   // Nếu chỉ trùng email
    //   final snackBar = SnackBar(
    //     content: const Text('Gmail đã tồn tại'),
    //     action: SnackBarAction(
    //       label: 'Undo',
    //       onPressed: () {},
    //     ),
    //   );
    //   // ignore: use_build_context_synchronously
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   accountError = false;
    //   phoneError = false;
    //   emailError = false;
    // }
  }

  void registerUser() {
    // ignore: deprecated_member_use
    var userRef =
        // ignore: deprecated_member_use
        FirebaseDatabase.instance.reference().child("users");
    // ignore: unnecessary_null_comparison
    // Nếu email rỗng, hiển thị lỗi
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text,
      password: passController.text,
    )
        .then((userCredential) {
      // Lấy UID của người dùng mới đăng ký
      String? uid = userCredential.user?.uid; // Use null-aware operator here
      if (uid != null) {
        // Tạo một map chứa thông tin người dùng
        var userData = {
          "name": nameController.text,
          "phone": phoneController.text,
          // Các thông tin khác nếu cần
        };
print('hi1');
        // Cập nhật thông tin người dùng trong cơ sở dữ liệu
        userRef.child(uid).set(userData).then((_) {
          print('hi');
          // Xử lý thành công sau khi cập nhật cơ sở dữ liệu
          final snackBar = SnackBar(
            content: const Text('Đăng ký thành công!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          nameController.clear();
          passController.clear();
          emailController.clear();
          phoneController.clear();
        }).catchError((error) {
          // Xử lý lỗi nếu có
          // ignore: avoid_print
          print("Error updating user data: $error");
        });
      } else {
        // Handle the case where uid is null
        // You might want to display an error message or handle it accordingly
        // ignore: avoid_print
        print("UID is null");
      }
    }).catchError((error) {
      // Xử lý lỗi nếu có khi đăng ký
      // ignore: avoid_print
      print("Error creating user: $error");
    });
//3 giây sau thực hiện
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const Register(),
    //     ),
    //   );
    // });
  }
}
