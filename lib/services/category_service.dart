import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shahz_cart_shopping_app/models/category_model.dart';


class CategoryService {
  static const String baseUrl =
      'https://dummyjson.com/products/categories';


  Future<List<CategoryModel>> getCategories()async{
    final response = await http.get(Uri.parse(baseUrl));


    if(response.statusCode == 200){

      final List data = jsonDecode(response.body);

      return data.map((e) =>CategoryModel.fromJson(e)).toList();
    }
    throw Exception('Failed to load categoris');
  }


  Future<String>getCategoryImage(String slug) async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products/category/$slug')
    );
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);

      return data['products'][2]['thumbnail'];
    }
    throw Exception('Failes to load category image');
  }

}