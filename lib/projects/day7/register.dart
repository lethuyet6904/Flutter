import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final _formkey = GlobalKey<FormState>();
  bool _isPassWord = true;
  bool _isConfirmPassWord = true;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Form Đăng Ký',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Họ tên",
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập họ và tên";
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),

              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Email",
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập email";
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),

              TextFormField(
                controller: _passwordController,
                obscureText: _isPassWord,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Mật khẩu",
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isPassWord ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isPassWord = !_isPassWord;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập mật khẩu";
                  }
                  if (value.length < 6) {
                    return "Mật khẩu phải từ 6 ký tự trở lên";
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),

              // Xác nhận mật khẩu
              TextFormField(
                controller: _confirmController,
                obscureText: _isConfirmPassWord,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: "Xác nhận mật khẩu",
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  suffixIcon: IconButton(
                    icon: Icon(_isConfirmPassWord
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isConfirmPassWord = !_isConfirmPassWord;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập xác nhận mật khẩu";
                  }
                  if (value != _passwordController.text) {
                    return "Mật khẩu xác nhận không trùng khớp";
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Đăng ký thành công!")),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.app_registration),
                      SizedBox(width: 10),
                      Text('Đăng ký'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
