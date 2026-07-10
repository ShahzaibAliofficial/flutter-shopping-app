import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main(){
  runApp(ShahzCart());
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