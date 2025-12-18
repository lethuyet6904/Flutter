import 'package:dio/dio.dart';
import 'package:flutter_portfolio/projects/day9/model/product.dart';

class API{
  Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    var response = await dio.request('https://fakestoreapi.com/products');
    List<Product> listProduct = [];
    if(response.statusCode == 200){
      List data = response.data;
      listProduct = data.map((x)=>Product.fromJson(x)).toList();
    }else{
      print("Error!!!");
    }
    return listProduct;
  }
}

var test_api = API();