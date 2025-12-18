import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user.dart';

class AuthService {
  static const String _loginUrl = 'https://dummyjson.com/auth/login';

  Future<User?> login(String username, String password) async {
    try {
      // 1. Gửi yêu cầu đăng nhập
      final response = await http.post(
        Uri.parse(_loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final loginData = jsonDecode(response.body);
        final int userId = loginData['id']; // Lấy ID của user vừa login
        final String token = loginData['accessToken']; // Lưu token

        // 2. Gọi thêm API lấy chi tiết để có đầy đủ phone, address, birthDate
        final detailResponse = await http.get(
          Uri.parse('https://dummyjson.com/users/$userId'),
        );

        if (detailResponse.statusCode == 200) {
          final userData = jsonDecode(detailResponse.body);
          // Thêm token vào map dữ liệu trước khi parse vào Model
          userData['accessToken'] = token; 
          return User.fromJson(userData);
        }
      }
      return null;
    } catch (e) {
      print("Lỗi: $e");
      return null;
    }
  }
}