import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: MyBody(),
    );
  }

  Widget MyBody() {
    return Column(
      children: [
        Block1(),
        Block2(),
        Expanded(child: Block3()),
      ],
    );
  }

  Widget Block1() {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
      color: const Color(0xFF1E4D99),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.orange.shade600,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.arrow_back_ios, size: 18, color: Colors.black87),
            const SizedBox(width: 12),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Xung quanh vị trí hiện tại',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '23 thg 10 - 24 thg 10',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // BLOCK 2: Toolbar (Sắp xếp, Lọc, Bản đồ)
  Widget Block2() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.swap_vert, size: 18),
              label: const Text(
                'Sắp xếp',
                style: TextStyle(color: Colors.black87, fontSize: 13),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 8),
                side: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.tune, size: 18, color: Colors.black87),
              label: const Text(
                'Lọc',
                style: TextStyle(color: Colors.black87, fontSize: 13),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 8),
                side: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map_outlined, size: 18, color: Colors.black87),
              label: const Text(
                'Bản đồ',
                style: TextStyle(color: Colors.black87, fontSize: 13),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 8),
                side: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // BLOCK 3: Danh sách khách sạn
  Widget Block3() {
    return Container(
      color: Colors.grey[100],
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Số lượng
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              '757 chỗ nghỉ',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ),
          // Hotel 1
          HotelCard(
            imagePath: 'assets/images/PictureDay5_1.jpg',
            hasBreakfast: true,
            hotelName: 'aNhii Boutique',
            rating: 9.5,
            ratingText: 'Xuất sắc',
            reviewCount: 95,
            location: 'Huế • Cách bạn 0.6km',
            roomInfo: '1 suite riêng tư: 1 giường',
            price: 'US\$109',
            hasTaxInfo: true,
          ),
          const SizedBox(height: 16),
          // Hotel 2
          HotelCard(
            imagePath: 'assets/images/PictureDay5_2.jpg',
            hasBreakfast: true,
            hotelName: 'An Nam Hue Boutique',
            rating: 9.2,
            ratingText: 'Tuyệt hảo',
            reviewCount: 34,
            location: 'Cư Chính • Cách bạn 0.9km',
            roomInfo: '1 phòng khách sạn: 1 giường',
            price: 'US\$20',
            hasTaxInfo: true,
          ),
          const SizedBox(height: 16),
          // Hotel 3
          HotelCard(
            imagePath: 'assets/images/PictureDay5_3.jpg',
            hasBreakfast: false,
            hotelName: 'Huế Jade Hill Villa',
            rating: 8.0,
            ratingText: 'Rất tốt',
            reviewCount: 1,
            location: 'Cư Chính • Cách bạn 1.3km',
            roomInfo:
                '1 biệt thự nguyên căn - 1.000 m²:\n4 giường • 3 phòng ngủ • 1 phòng\nkhách • 3 phòng tắm',
            price: 'US\$285',
            hasTaxInfo: true,
            hasWarning: true,
            warningText: 'Chỉ còn 1 căn, tất cả trên Booking.com',
            hasNoPayment: true,
          ),
          const SizedBox(height: 16),
          // Hotel 4
          HotelCard(
            imagePath: 'assets/images/PictureDay5_4.jpg',
            hasBreakfast: true,
            hotelName: 'Em Villa',
            rating: null,
            ratingText: null,
            reviewCount: null,
            location: 'Được quản lý bởi một host cá nhân',
            roomInfo: null,
            price: null,
            hasTaxInfo: false,
          ),
        ],
      ),
    );
  }
}

// Widget Card cho từng khách sạn
class HotelCard extends StatelessWidget {
  final String imagePath;
  final bool hasBreakfast;
  final String hotelName;
  final double? rating;
  final String? ratingText;
  final int? reviewCount;
  final String location;
  final String? roomInfo;
  final String? price;
  final bool hasTaxInfo;
  final bool hasWarning;
  final String? warningText;
  final bool hasNoPayment;

  const HotelCard({
    super.key,
    required this.imagePath,
    this.hasBreakfast = false,
    required this.hotelName,
    this.rating,
    this.ratingText,
    this.reviewCount,
    required this.location,
    this.roomInfo,
    this.price,
    this.hasTaxInfo = false,
    this.hasWarning = false,
    this.warningText,
    this.hasNoPayment = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(  // ĐỔI TỪ Column → Row
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(8)),
                child: Image.asset(
                  imagePath,
                  width: 130,
                  height: 160,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 130,
                      height: 160,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.image, size: 40, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
              if (hasBreakfast)
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Bao bữa sáng',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          // Content - THÊM Expanded
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and favorite
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          hotelName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const Icon(Icons.favorite_border, color: Colors.black54, size: 22),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Stars (nếu có rating)
                  if (rating != null)
                    Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 14,
                        ),
                      ),
                    ),
                  if (rating != null) const SizedBox(height: 6),
                  // Rating
                  if (rating != null && ratingText != null)
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFF003B95),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            rating.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          ratingText!,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '• $reviewCount đánh giá',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 6),
                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 14, color: Colors.black54),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style: const TextStyle(fontSize: 12, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                  // Room info
                  if (roomInfo != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      roomInfo!,
                      style: const TextStyle(fontSize: 11, color: Colors.black54),
                    ),
                  ],
                  // BỎ Spacer vì không cần thiết nữa
                  // Price section
                  if (price != null) ...[
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        price!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    if (hasTaxInfo)
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Đã bao gồm thuế và phí',
                          style: TextStyle(fontSize: 10, color: Colors.black54),
                        ),
                      ),
                  ],
                  // Warning
                  if (hasWarning && warningText != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        warningText!,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.red[800],
                        ),
                      ),
                    ),
                  ],
                  // No payment text
                  if (hasNoPayment) ...[
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        Icon(Icons.check, size: 14, color: Colors.green),
                        SizedBox(width: 4),
                        Text(
                          'Không cần thanh toán trước',
                          style: TextStyle(fontSize: 10, color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}