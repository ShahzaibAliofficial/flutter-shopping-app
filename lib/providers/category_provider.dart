import 'package:flutter/material.dart';
import 'package:shahz_cart_shopping_app/models/category_model.dart';
import 'package:shahz_cart_shopping_app/services/category_service.dart';


class CategoryProvider extends ChangeNotifier {
  final CategoryService _categoryService = CategoryService();

  List<CategoryModel> _Categories = [];

  List<CategoryModel> get Categories => _Categories;

  bool _isLoading = false;

  bool get isLoading => _isLoading;


  Future<void> fetchCategories() async{
    _isLoading = true;
    notifyListeners();

    _Categories = await _categoryService.getCategories();

    _isLoading = false;
    notifyListeners();
  }

}