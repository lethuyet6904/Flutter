import 'package:flutter/material.dart';
import 'change_color_app.dart';
import 'count_app.dart';
import 'countdown_timer_page.dart';

class Day6App extends StatelessWidget {
  const Day6App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "1. Change Color App",
              Icons.color_lens,
              Colors.purple,
              const ChangeColorApp(),
            ),

            _buildMenuButton(
              context,
              "2. Count App",
              Icons.exposure_plus_1,
              Colors.orange,
              const CountApp(),
            ),

            _buildMenuButton(
              context,
              "3. Countdown Timer",
              Icons.timer,
              Colors.green,
              const CountdownTimerPage(),
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