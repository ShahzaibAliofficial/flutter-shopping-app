import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shahz_cart_shopping_app/providers/category_provider.dart';
import 'package:shahz_cart_shopping_app/services/category_service.dart';

class allCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
            itemCount: provider.Categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final category = provider.Categories[index];
              final categoryService = CategoryService();

              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder<String>(
                      future: categoryService.getCategoryImage(category.slug),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return CircularProgressIndicator();
                        }
                        if(snapshot.hasError){
                          return const Icon(Icons.error);
                        }
                        return Image.network(snapshot.data!);
                      },
                    ),
                    Text(category.name,textAlign: TextAlign.center,style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
