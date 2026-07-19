import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shahz_cart_shopping_app/providers/wish_list_provider.dart';
import 'product_detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';


class WishListScreen extends StatefulWidget{
  WishListScreen({super.key});
  
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen>{
  @override
  Widget build(BuildContext context) {
    final wishlisProvider = Provider.of<WishListProvider>(context);


    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(

        title: Text('My Wishlist',style: GoogleFonts.abrilFatface(fontWeight: FontWeight.bold,
            fontSize: h*0.03),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: h*0.03),
        child: ListView.builder(
            itemCount: wishlisProvider.wishlist.length,
            itemBuilder: (context, index){
              final product = wishlisProvider.wishlist[index];
              return Align(
                alignment: Alignment.center,
                child: Container(
                  width:w*0.93,
                  height: h*0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(h*0.01)
                  ),
                  child: InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product)));
                    },
                    child: Card(
                      elevation: 3,
                      child: Row(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Card(
                                  elevation: 5,
                                  color: Colors.grey.shade100,
                                  child: Image.network(product.thumbnail,height: h*0.12,)
                              )
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(top: h*0.013,left: w*0.013),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(product.title,overflow: TextOverflow.ellipsis,style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: h*0.019
                                      ),)),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: w*0.013,top: h*0.015),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(product.brand,style: TextStyle(
                                        fontSize: h*0.018
                                      ),)),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: w*0.013,top: h*0.015),
                                  child: Text("\$${product.price}",style: TextStyle(
                                    fontSize: h*0.018,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent.shade700
                                  ),),
                                )
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(onPressed: (){
                              wishlisProvider.removeToWishlist(product);
                            }, icon: Icon(Icons.delete,color: Colors.blueAccent.shade700,)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );

  }
}