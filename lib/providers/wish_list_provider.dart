import 'package:flutter/material.dart';
import 'package:shahz_cart_shopping_app/models/product_model.dart';

class WishListProvider extends ChangeNotifier{
  List<ProductModel> _wishlist = [];
List<ProductModel> get wishlist => _wishlist;

  void addToWishlist(ProductModel product){
    _wishlist.add(product);
    notifyListeners();
  }

  void removeToWishlist(ProductModel product){
    _wishlist.remove(product);
    notifyListeners();
  }

  void toggleWishlist(ProductModel product){
    if(_wishlist.contains(product)){
      _wishlist.remove(product);
    }
    else{
      _wishlist.add(product);
    }
    print("Wishlist Items: ${_wishlist.length}");

    notifyListeners();
  }
}

