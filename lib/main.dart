import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// --- IMPORT CÁC BÀI TẬP CỦA BẠN ---
// Đảm bảo bạn đã có đủ các thư mục và file này
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

// Class định nghĩa cấu trúc của một bài tập
class ProjectDay {
  final String title;
  final String description;
  final Widget destinationPage;
  final IconData icon;

  ProjectDay({
    required this.title,
    required this.description,
    required this.destinationPage,
    required this.icon,
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
      title: 'Flutter Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
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
  // -1: Là trang chủ (Profile)
  // 0, 1, 2...: Là các bài tập tương ứng
  int _selectedIndex = -1;

  // Danh sách các bài tập
  final List<ProjectDay> projects = [
    ProjectDay(title: "Bài 1: Làm quen", description: "Hello World", destinationPage: const Day1App(), icon: Icons.flutter_dash),
    ProjectDay(title: "Bài 2: Layout", description: "Layout cơ bản", destinationPage: const Day2App(), icon: Icons.dashboard_customize),
    ProjectDay(title: "Bài 3: ListView", description: "Danh sách", destinationPage: const Day3App(), icon: Icons.view_list),
    ProjectDay(title: "Bài 4: GridView", description: "Lưới", destinationPage: const Day4App(), icon: Icons.grid_view),
    ProjectDay(title: "Bài 5: Booking", description: "App đặt phòng", destinationPage: const Day5App(), icon: Icons.hotel),
    ProjectDay(title: "Bài 6: State", description: "StatefulWidget", destinationPage: const Day6App(), icon: Icons.settings_applications),
    ProjectDay(title: "Bài 7: Form", description: "Đăng nhập/Đăng ký", destinationPage: const Day7App(), icon: Icons.login),
    ProjectDay(title: "Bài 8: BMI", description: "Tính toán", destinationPage: const Day8App(), icon: Icons.calculate),
    ProjectDay(title: "Bài 9: Products", description: "Danh sách SP (API)", destinationPage: const Day9App(), icon: Icons.shopping_bag),
    ProjectDay(title: "Bài 10: News", description: "Tin tức API", destinationPage: const Day10App(), icon: Icons.newspaper),
    ProjectDay(title: "Bài 11: Profile", description: "User Profile", destinationPage: const Day11App(), icon: Icons.person),
  ];

  // Hàm mở link Github
  Future<void> _launchGithub() async {
    const url = 'https://github.com/lethuyet6904/Flutter';
    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint("Lỗi mở link: $e");
    }
  }

  // Hàm xử lý khi chọn menu
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Đóng Drawer sau khi chọn
  }

  // --- GIAO DIỆN PROFILE (TRANG CHỦ) ---
  Widget _buildProfileView() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 65,
                backgroundImage: AssetImage('assets/images/avatar.png'),
                backgroundColor: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Lê Thanh Thuyết",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Mobile Developer",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.green, size: 20),
        ),
        const SizedBox(width: 15),
        Text(
          text,
          style: const TextStyle(fontSize: 15, color: Colors.black87),
        ),
      ],
    );
  }

  // --- HÀM BUILD CHÍNH ---
  @override
  Widget build(BuildContext context) {
    // 1. Xác định nội dung body
    Widget currentBody;
    String currentTitle;

    if (_selectedIndex == -1) {
      currentBody = _buildProfileView();
      currentTitle = "Hồ sơ của tôi";
    } else {
      currentBody = projects[_selectedIndex].destinationPage;
      currentTitle = projects[_selectedIndex].title;
    }

    return Scaffold(
      // 2. AppBar với nút Home
      appBar: AppBar(
        title: Text(
          currentTitle,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          // Nếu KHÔNG phải trang chủ thì hiện nút Home để quay về
          if (_selectedIndex != -1)
            IconButton(
              icon: const Icon(Icons.home),
              tooltip: "Về trang chủ",
              onPressed: () {
                setState(() {
                  _selectedIndex = -1;
                });
              },
            ),
          const SizedBox(width: 10),
        ],
      ),

      // 3. Drawer (Menu)
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
              accountName: const Text(
                "Lê Thanh Thuyết",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              accountEmail: const Text("lethuyet6904@gmail.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
                backgroundColor: Colors.white,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const Divider(),
                  // Tạo danh sách các bài tập
                  ...List.generate(projects.length, (index) {
                    final item = projects[index];
                    return ListTile(
                      leading: Icon(item.icon, color: Colors.grey[700]),
                      title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.w500)),
                      selected: _selectedIndex == index,
                      selectedTileColor: Colors.green.withOpacity(0.1),
                      selectedColor: Colors.green,
                      onTap: () => _onItemTapped(index),
                    );
                  }),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.code, color: Colors.black87),
              title: const Text("GitHub"),
              onTap: _launchGithub,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      // 4. Nội dung chính
      body: currentBody,
    );
  }
}