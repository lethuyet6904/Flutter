class User {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String image;
  final String token;
  
  // Thông tin cơ bản
  final String phone;
  final String gender;
  final String birthDate;
  
  // Địa chỉ
  final String address;
  final String city;
  final String state;
  final String country;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.token,
    required this.phone,
    required this.gender,
    required this.birthDate,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
  });
  
  factory User.fromJson(Map<String, dynamic> json) {
    // 1. Kiểm tra kỹ tên key trong JSON (Hình ảnh cho thấy key là 'phone' và 'birthDate')
    return User(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      image: json['image'] ?? '', 
      token: json['accessToken'] ?? '', // API login trả về accessToken
      
      // Đảm bảo lấy đúng key từ JSON bạn chụp
      phone: json['phone'] ?? 'Chưa có số', 
      birthDate: json['birthDate'] ?? 'Chưa có ngày sinh',
      
      gender: json['gender'] != null 
          ? "${json['gender'].toString()[0].toUpperCase()}${json['gender'].toString().substring(1)}"
          : 'Khác',
      
      // Lưu ý: API Login thường không trả về object 'address'
      // Bạn cần gán giá trị mặc định hoặc kiểm tra kỹ
      address: json['address']?['address'] ?? '',
      city: json['address']?['city'] ?? '',
      state: json['address']?['state'] ?? '',
      country: json['address']?['country'] ?? '',
    );
  }

  String get fullName => "$firstName $lastName";
  
  String get fullAddress {
    List<String> parts = [];
    if (address.isNotEmpty) parts.add(address);
    if (city.isNotEmpty) parts.add(city);
    if (state.isNotEmpty) parts.add(state);
    if (country.isNotEmpty) parts.add(country);
    return parts.isEmpty ? "Chưa cập nhật" : parts.join(", ");
  }
}