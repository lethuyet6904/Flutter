import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// --- IMPORT CÁC BÀI TẬP ---
import './projects/day1/main.dart';
import './projects/day2/main.dart';
import './projects/day3/main.dart';
import './projects/day4/main.dart';
import './projects/day5/main.dart';
import './projects/day6/main.dart';
import './projects/day7/main.dart';
import './projects/day8/main.dart';
import './projects/day9/main.dart';
import './projects/day10/main.dart';
import './projects/day11/main.dart';

// --- MODEL DỮ LIỆU (Đã bỏ Icon) ---
class ProjectDay {
  final String title;
  final String description;
  final Widget destinationPage;

  ProjectDay({
    required this.title,
    required this.description,
    required this.destinationPage,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lê Thanh Thuyết Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        fontFamily: 'Roboto', 
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  // --- DANH SÁCH BÀI TẬP (Đã bỏ tham số icon) ---
  final List<ProjectDay> projects = [
    ProjectDay(title: "Day 1: Hello World", description: "Làm quen giao diện & Cấu trúc", destinationPage: const Day1App()),
    ProjectDay(title: "Day 2: Properties", description: "Các thuộc tính cơ bản Dart", destinationPage: const Day2App()),
    ProjectDay(title: "Day 3: UI Layouts", description: "Row, Column, Stack", destinationPage: const Day3App()),
    ProjectDay(title: "Day 4: State Management", description: "Quản lý trạng thái cơ bản", destinationPage: const Day4App()),
    ProjectDay(title: "Day 5: User Inputs", description: "TextField & Form Handling", destinationPage: const Day5App()),
    ProjectDay(title: "Day 6: Scroll View", description: "ListView & GridView", destinationPage: const Day6App()),
    ProjectDay(title: "Day 7: Navigation", description: "Chuyển màn hình & Route", destinationPage: const Day7App()),
    ProjectDay(title: "Day 8: Async Programming", description: "Future, Async, Await", destinationPage: const Day8App()),
    ProjectDay(title: "Day 9: API Integration", description: "Kết nối REST API", destinationPage: const Day9App()),
    ProjectDay(title: "Day 10: Advanced State", description: "Quản lý dữ liệu phức tạp", destinationPage: const Day10App()),
    ProjectDay(title: "Day 11: Final Project", description: "Tổng hợp kiến thức", destinationPage: const Day11App()),
  ];

  Future<void> _launchGithub() async {
    const url = 'https://github.com/lethuyet6904';
    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint("Lỗi mở link: $e");
    }
  }

  void _showProfileDetails() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 450,
          child: Column(
            children: [
              Container(width: 40, height: 5, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10))),
              const SizedBox(height: 20),
              const CircleAvatar(radius: 60, backgroundImage: AssetImage('assets/images/avatar.jpg'), backgroundColor: Colors.green),
              const SizedBox(height: 15),
              const Text("Lê Thanh Thuyết", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
              const Text("Mobile Developer", style: TextStyle(color: Colors.grey, fontSize: 16)),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _launchGithub,
                  icon: const Icon(Icons.code),
                  label: const Text("Truy cập GitHub của tôi"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(onPressed: () => Navigator.pop(context), child: const Text("Đóng", style: TextStyle(color: Colors.grey)))
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Navbar Xanh lá
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF43A047), Color(0xFF66BB6A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lê Thanh Thuyết", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: _showProfileDetails,
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                child: const CircleAvatar(radius: 22, backgroundImage: AssetImage('assets/images/avatar.jpg'), backgroundColor: Colors.white),
              ),
            ),
          )
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
            child: Row(
              children: [
                Container(width: 5, height: 25, decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10))),
                const SizedBox(width: 10),
                const Text("Danh sách bài tập", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated( // Dùng Separated để có đường kẻ mờ giữa các bài
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              itemCount: projects.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = projects[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    // Viền mỏng, không icon, rất clean
                    border: Border.all(color: Colors.grey.withOpacity(0.2)), 
                    boxShadow: [
                      BoxShadow(color: Colors.grey.withOpacity(0.05), spreadRadius: 1, blurRadius: 5, offset: const Offset(0, 2)),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    // BỎ LEADING ICON Ở ĐÂY
                    title: Text(
                      item.title, 
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87)
                    ),
                    subtitle: Text(item.description, style: TextStyle(color: Colors.grey[500], fontSize: 13)),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.green, size: 14), // Mũi tên nhỏ tinh tế
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => item.destinationPage));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}