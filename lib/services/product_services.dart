import 'dart:math';

import 'package:shahz_cart_shopping_app/models/product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ProductServices {
  static const String baseUrl =
      'https://dummyjson.com/products/category/';
  Future<List<ProductModel>> getProductByCategory(String slug) async {
  final response = await http.get(
    Uri.parse('$baseUrl$slug'),
  );
  if(response.statusCode == 200){
    final data = jsonDecode(response.body);
    final List products = data ['products'];
    return products.map((e) => ProductModel.fromJson(e)).toList();
  }
  throw Exception('Failed to load products');
  }
}