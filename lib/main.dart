import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'providers/category_provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(create: (_) => CategoryProvider(),
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