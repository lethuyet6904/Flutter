import 'package:flutter/material.dart';
import 'form_bmi.dart';
import 'form_feedback.dart';

class Day8App extends StatelessWidget {
  const Day8App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bài tập Day 8"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Danh sách bài tập:", 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Nút bấm vào bài 1: Login
            _buildMenuButton(
              context,
              "1. FormBmi Screen",
              Icons.login, // Đã đổi icon thành nút Login
              Colors.blue,
              const FormBmi(),
            ),
            
            // Nút bấm vào bài 2: Register
            _buildMenuButton(
              context,
              "2. FormFeedback Screen",
              Icons.person_add, // Đã đổi icon thành hình thêm người
              Colors.green,
              const FormFeedback(),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm tạo nút bấm
  Widget _buildMenuButton(BuildContext context, String title, IconData icon, Color color, Widget page) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}