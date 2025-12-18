import 'dart:math';
import 'package:flutter/material.dart';

class ChangeColorApp extends StatefulWidget {
  const ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  Color color = Colors.white;
  String stringColor = "Trắng";
  // Danh sách 5 màu
  List<String> stringListColor = ['Xanh dương', 'Xanh lá', 'Đỏ', 'Vàng', 'Cam','Hồng'];
  List<Color> listColor = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.orange,
    Colors.pink,
  ];

  void changeColor() {
    setState(() {
      var random = Random();
      var index = random.nextInt(listColor.length);
      color = listColor[index];
      stringColor = stringListColor[index];
    });
  }

  void resetColor() {
    setState(() {
      color = Colors.black;
      stringColor = "Đen";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Change Color App",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black45,
      ),
      body: Container(
        color: color,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                stringColor,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: changeColor,
                    child: const Text("Change Color"),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: resetColor,
                    child: const Text("Reset Color"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
