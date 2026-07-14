import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shahz_cart_shopping_app/providers/product_provider.dart';
import 'product_detail_screen.dart';
import 'package:shahz_cart_shopping_app/models/category_model.dart';

class ProductsScreen extends StatelessWidget {
  final String categoryName;
  const ProductsScreen({
    super.key,

    required this.categoryName
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName,style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
            itemCount: provider.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 300
            ),
            itemBuilder: (context, index) {
              final products = provider.products[index];

              return InkWell(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: products,)));
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                products.thumbnail,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(products.title,style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          Text('${products.brand}'),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text("\$${products.price}",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),),
                                SizedBox(
                                  width: 70,
                                ),
                                Icon(Icons.star,color: Colors.orange.shade300,size: 20,)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
