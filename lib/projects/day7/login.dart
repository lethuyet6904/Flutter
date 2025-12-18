import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _formkey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Form Đăng Nhập', style: TextStyle(fontWeight: FontWeight.bold),)),
        backgroundColor: Colors.blueAccent,
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
                  hintText: "Tên đăng nhập",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) { 
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập tên người dùng";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Mật khẩu",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
                validator: (value) { 
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập mật khẩu";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white 
                ),
                onPressed: (){
                  if (_formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Đăng nhập thành công!")),
                    );
                  }
                }, 
                child:
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.login),
                      SizedBox(width: 10,),
                      Text('Đăng nhập')
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
