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
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
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

            _buildMenuButton(
              context,
              "1. Tính chỉ số BMI",
              Icons.monitor_weight, 
              Colors.orange,     
              const FormBmi(),
            ),
            
            _buildMenuButton(
              context,
              "2. Gửi phản hồi (Feedback)",
              Icons.rate_review, 
              Colors.green,
              const FormFeedback(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, IconData icon, Color color, Widget page) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Bo góc xíu cho mềm mại
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1), // Nền nhạt
          child: Icon(icon, color: color),         // Icon đậm
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
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