import 'package:flutter/material.dart';
import 'package:shahz_cart_shopping_app/providers/product_provider.dart';
import 'package:shahz_cart_shopping_app/screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'providers/category_provider.dart';
import 'package:shahz_cart_shopping_app/providers/wish_list_provider.dart';
import 'package:shahz_cart_shopping_app/screens/favorite_screen.dart';

void main(){
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CategoryProvider()),
          ChangeNotifierProvider(create: (_) => ProductProvider()),
          ChangeNotifierProvider(create: (_) => WishListProvider()),
        ],
      child: ShahzCart(),
    )
  );
}

class ShahzCart extends StatelessWidget{
  ShahzCart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}