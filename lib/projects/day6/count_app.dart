import 'package:flutter/material.dart';

class CountApp extends StatefulWidget {
  const CountApp({super.key});

  @override
  State<CountApp> createState() => _CountAppState();
}

class _CountAppState extends State<CountApp> {
  var Count = 0;
  var luu = 0;
  void changeTang() {
    setState(() {
      Count++;
    });
  }

  void changeGiam() {
    setState(() {
      Count--;
    });
  }

  void changeReset() {
    setState(() {
      Count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Count App",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Giá trị hiện tại",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                Count.toString(),
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: changeGiam,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_downward),
                        const Text("Giảm"),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: changeReset,
                    child: Row(
                      children: [Icon(Icons.refresh), const Text("Reset")],
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: changeTang,
                    child: Row(
                      children: [Icon(Icons.arrow_upward), Text("Tăng")],
                    ),
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
