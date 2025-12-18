import 'package:flutter/material.dart';
import 'package:flutter_portfolio/projects/day10/model/product.dart';
import 'api.dart';
import 'product_detail.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  List<Product> allProducts = [];
  List<Product> displayProducts = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Danh Sách Bài Viết', 
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Product>>(
        future: test_api.getAllProduct(), 
        builder: (context, snap){
          if(snap.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          
          if (snap.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 60, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      'Lỗi tải dữ liệu',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${snap.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          }
          
          if (!snap.hasData || snap.data == null || snap.data!.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.article_outlined, size: 60, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Không có bài viết nào.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            );
          }
          
          allProducts = snap.data!;
          displayProducts = allProducts;
          return buildBody();
        } 
      ),
    );
  }

  Widget buildBody() {
    return ListView.builder(
      itemCount: displayProducts.length,
      itemBuilder: (context, index) {
        final product = displayProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(product: product), // Ensure 'product' is passed correctly
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hiển thị Thumbnail
                  if (product.urlToImage.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.network(
                        product.urlToImage,
                        width: 100,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => 
                            Container(
                              width: 100,
                              height: 80,
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.image_not_supported, 
                                size: 40, 
                                color: Colors.grey
                              ),
                            ),
                      ),
                    ),
                  const SizedBox(width: 12.0),
                  
                  // Hiển thị Tiêu đề và Mô tả ngắn
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          product.description,
                          style: const TextStyle(
                            fontSize: 14.0, 
                            color: Colors.grey
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
} 