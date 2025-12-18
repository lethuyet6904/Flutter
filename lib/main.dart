import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Đảm bảo đường dẫn import đúng với cấu trúc thư mục của bạn
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
  final List<ProjectDay> projects = [
    ProjectDay(title: "Bài 1: Làm quen với Flutter", description: "Khởi đầu với Flutter framework", destinationPage: const Day1App(), icon: Icons.flutter_dash),
    ProjectDay(title: "Bài 2: Basic Layout & Styling", description: "Thiết kế giao diện cơ bản", destinationPage: const Day2App(), icon: Icons.dashboard_customize),
    ProjectDay(title: "Bài 3: ListView & Custom Card", description: "Danh sách và thẻ tùy chỉnh", destinationPage: const Day3App(), icon: Icons.view_list),
    ProjectDay(title: "Bài 4: GuideToLayout", description: "Hướng dẫn bố cục nâng cao", destinationPage: const Day4App(), icon: Icons.grid_view),
    ProjectDay(title: "Bài 5: Hotel Booking App", description: "Ứng dụng đặt phòng khách sạn", destinationPage: const Day5App(), icon: Icons.hotel),
    ProjectDay(title: "Bài 6: StatefulWidget", description: "Quản lý trạng thái widget", destinationPage: const Day6App(), icon: Icons.settings_applications),
    ProjectDay(title: "Bài 7: Login, Register Form", description: "Form đăng nhập và đăng ký", destinationPage: const Day7App(), icon: Icons.login),
    ProjectDay(title: "Bài 8: BMI và Feedback Form", description: "Tính toán BMI và biểu mẫu phản hồi", destinationPage: const Day8App(), icon: Icons.calculate),
    ProjectDay(title: "Bài 9: List Products", description: "Danh sách sản phẩm", destinationPage: const Day9App(), icon: Icons.shopping_bag),
    ProjectDay(title: "Bài 10: NewsAPI", description: "Tích hợp API tin tức", destinationPage: const Day10App(), icon: Icons.newspaper),
    ProjectDay(title: "Bài 11: Login and Profile", description: "Đăng nhập và hồ sơ người dùng", destinationPage: const Day11App(), icon: Icons.person),
  ];

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

  void _showProfileDetails() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 30),
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
              _buildInfoRow(Icons.code, "Flutter & Dart"),
              const SizedBox(height: 12),
              _buildInfoRow(Icons.phone_android, "Mobile Development"),
              const SizedBox(height: 12),
              _buildInfoRow(Icons.school, "Student Developer"),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: _launchGithub,
                  icon: const Icon(Icons.code, size: 22),
                  label: const Text(
                    "Xem GitHub của tôi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Đóng",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
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
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Đã giảm chiều cao xuống 54 (mặc định là 56, bạn để 60 hơi to)
        toolbarHeight: 54,
        elevation: 0,
        backgroundColor: Colors.green,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Lê Thanh Thuyết",
              style: TextStyle(
                fontSize: 16, // Giảm font size một chút cho cân đối
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Flutter Portfolio",
              style: TextStyle(
                fontSize: 11, // Giảm font size subtitle
                color: Colors.white70,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: _showProfileDetails,
              child: const CircleAvatar(
                radius: 16, // Giảm radius avatar trên navbar một chút
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Danh sách bài tập",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${projects.length} bài",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              itemCount: projects.length, // Sửa lỗi: Chỉ để itemCount 1 lần ở đây
              itemBuilder: (context, index) {
                final item = projects[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => item.destinationPage),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green.withOpacity(0.8),
                                    Colors.green,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(item.icon,
                                  color: Colors.white, size: 26),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.description,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.green,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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