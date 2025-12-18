import 'package:dio/dio.dart';
import 'package:flutter_portfolio/projects/day10/model/product.dart';

class API {
  Future<List<Product>> getAllProduct() async {
    try {
      var dio = Dio();
      var response = await dio.get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          'country': 'us',
          'category': 'business',
          'apiKey': 'b3367a81c8064bb7b23754bdafb66ecb',
        },
      );

      if (response.statusCode == 200) {
        // News API trả về { "status": "ok", "articles": [...] }
        final data = response.data;
        
        if (data is Map<String, dynamic> && data['articles'] != null) {
          final List<dynamic> articles = data['articles'];
          return articles.map((article) => Product.fromJson(article as Map<String, dynamic>)).toList();
        }
      }
      
      print('Error!!! Status code: ${response.statusCode}');
      return [];
      
    } catch (e) {
      print('Exception in getAllProduct: $e');
      rethrow; // Ném lại lỗi để FutureBuilder có thể bắt
    }
  }
}

var test_api = API();