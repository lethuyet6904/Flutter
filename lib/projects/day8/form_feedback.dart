import 'package:flutter/material.dart';

class FormFeedback extends StatefulWidget {
  const FormFeedback({super.key});

  @override
  State<FormFeedback> createState() => _FormFeedbackState();
}

class _FormFeedbackState extends State<FormFeedback> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  String? selectedStars;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gửi phản hồi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Họ và tên người gửi",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập họ và tên";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Chọn số sao",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.star),
                  ),
                  items: ["1", "2", "3", "4", "5"]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text("$e sao"),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedStars = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Vui lòng chọn số sao";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: contentController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: "Nội dung phản hồi",
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.feedback_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập nội dung phản hồi";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String name = nameController.text;
                      String stars = selectedStars!;
                      String content = contentController.text;

                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Phản hồi của bạn"),
                          content: Text(
                            "Người gửi: $name\n"
                            "Số sao: $stars sao\n"
                            "Nội dung: $content",
                            style: const TextStyle(fontSize: 16),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Đóng"),
                            )
                          ],
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.all(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Gửi phản hồi")
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}