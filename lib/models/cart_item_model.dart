import 'package:shahz_cart_shopping_app/models/product_model.dart';

class CartItemModel {
  final ProductModel product;
  int quantity;

  CartItemModel({required this.product,  this.quantity = 1});
}
