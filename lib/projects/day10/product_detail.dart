import 'package:flutter/material.dart';
import 'package:flutter_portfolio/projects/day10/model/product.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  Future<void> _launchUrl() async {
    if (product.url.isNotEmpty) {
      final Uri uri = Uri.parse(product.url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch ${product.url}');
      }
    }
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi Tiết Bài Viết'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tiêu đề
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 20, thickness: 1),

            // Ảnh Thumbnail
            if (product.urlToImage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    product.urlToImage,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(
                          height: 200,
                          color: Colors.grey[300],
                          child: const Center(child: Text('Không tải được ảnh')),
                        ),
                  ),
                ),
              ),

            // Thông tin chung
            _buildInfoRow('Tác giả:', product.author.isNotEmpty ? product.author : 'Không rõ'),
            _buildInfoRow('Nguồn:', product.source.name),
            _buildInfoRow('Ngày xuất bản:', product.publishedAt),
            const SizedBox(height: 16.0),

            // Mô tả
            const Text(
              'Mô tả:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),

            // Nội dung
            const Text(
              'Nội dung:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
            Text(
              product.content,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),

            // Liên kết gốc (Chức năng mở link)
            Center(
              child: ElevatedButton.icon(
                onPressed: _launchUrl,
                icon: const Icon(Icons.open_in_new),
                label: const Text('Mở bài viết gốc trong trình duyệt'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}