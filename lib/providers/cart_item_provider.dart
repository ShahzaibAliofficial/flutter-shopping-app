import 'package:flutter/material.dart';
import 'package:shahz_cart_shopping_app/models/cart_item_model.dart';
import 'package:shahz_cart_shopping_app/models/product_model.dart';

class CartItemProvider extends ChangeNotifier {
  final List<CartItemModel> _cart = [];

  List<CartItemModel> get cart => _cart;

  void addToCart (ProductModel product,int quantity){
    int index = _cart.indexWhere((item) => item.product.id == product.id);


    if(index != -1){
      _cart[index].quantity += quantity;
    }
    else{
      _cart.add(
        CartItemModel(product: product,quantity: quantity),
      );
    }
    notifyListeners();
  }
  void increaseQuantity(ProductModel product){
    int index1 = _cart.indexWhere((item1) => item1.product.id == product.id);

    if(index1 != -1 ){
      _cart[index1].quantity++;
      notifyListeners();
    }
  }
  void decreaseQuantity(ProductModel product){
    int index2 = _cart.indexWhere((item2) => item2.product.id == product.id);
    if(index2 != -1 &&  _cart[index2].quantity > 1){
      _cart[index2].quantity--;
      notifyListeners();
    }
  }

  void removeFromCart(ProductModel product){
    _cart.removeWhere((item3) => item3.product.id == product.id);
    notifyListeners();
  }
  double get totalPrice{
    double total = 0;

    for (var item in _cart){
      total += item.product.price * item.quantity;
    }
    return total;
  }

  int get totalItems{
    int total = 0;
    for(var item in _cart){
      total += item.quantity;
    }
    return total;
  }
  void clearCart(){
    _cart.clear();
    notifyListeners();
  }
}