import 'package:flutter/material.dart';
import 'package:shahz_cart_shopping_app/models/product_model.dart';
import 'package:shahz_cart_shopping_app/services/product_services.dart';

class ProductProvider  extends ChangeNotifier{
  final ProductServices _productServices = ProductServices();

  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchProducts(String slug) async{
    _isLoading = true;
    notifyListeners();

    _products = await _productServices.getProductByCategory(slug);

    _isLoading = false;
    notifyListeners();
  }
}