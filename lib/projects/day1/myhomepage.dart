import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(),
    );
  }

  Widget MyBody(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("Xin chào các bạn!", style: TextStyle(color: Colors.green, fontSize: 20),
        ),
        Icon(Icons.heart_broken, size: 70, color: Colors.red,),
        Text("Lập trình di động nhóm 3", style: TextStyle(fontSize: 20, color: Colors.pink),)
      ],
    );
  }
}