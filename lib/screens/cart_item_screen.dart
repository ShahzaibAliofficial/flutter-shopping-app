import 'package:provider/provider.dart';
import 'package:shahz_cart_shopping_app/models/product_model.dart';
import 'package:shahz_cart_shopping_app/providers/cart_item_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shahz_cart_shopping_app/screens/product_detail_screen.dart';


class CartItemScreen extends StatelessWidget{
  const CartItemScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final cartProvider = Provider.of<CartItemProvider>(context);

    double totalprice = 0;
    for(var item in cartProvider.cart){
      totalprice += item.product.price * item.quantity;
    }
    double totalDiscount = 0;
    for(var item in cartProvider.cart){
      totalDiscount += (item.product.price * item.product.discountPercentage / 100) * item.quantity;
    }
    
    double finalTotal = totalprice - totalDiscount;
    if(cartProvider.cart.isEmpty){
    return Scaffold(
      appBar: AppBar(
      title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Your Cart is Empty'),
      ),
    );
    }
    return Scaffold(
      appBar: AppBar(
        title:  Text('My Cart',style: GoogleFonts.abrilFatface(
          fontSize: h*0.035,
        ),),
        centerTitle: true,
      ),
      body: Column(
        children: [
      Center(
      child: Container(
      width: w*0.97,
        height: h*0.15,
        child: Card(
          elevation: 3,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: w*0.023),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: w*0.27,
                          height: h*0.12,
                          child: Card(
                            elevation: 8,
                            child: Icon(Icons.shopping_cart_outlined,size: h*0.08,color: Colors.blueAccent.shade700,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${cartProvider.cart.length} Items in Cart',style: TextStyle(
                          fontSize: h*0.024
                      ),),
                      Padding(
                        padding:  EdgeInsets.only(top: h*0.02,left: w*0.01),
                        child: Text('Review Your Item and \nproceed to checkout'),
                      )
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: w*0.05),
                    child: Text('\$ ${totalprice.toStringAsFixed(1)}',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: h*0.023,
                      color: Colors.blueAccent.shade700
                    ),),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ),
          Expanded(
            child: ListView.builder(
                itemCount: cartProvider.cart.length,
                itemBuilder: (context, index){
                final item = cartProvider.cart[index];
                Color stockColor;
                if(item.product.availabilityStatus == "In Stock"){
                  stockColor = Colors.green;
                }
                else{
                  stockColor = Colors.red;
                }
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: item.product,)));
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width:w*0.93,
                      height: h*0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(h*0.01)
                      ),
                      child: Card(
                          elevation: 3,
                          child: Row(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: w*0.3,
                                    height: h*0.16,
                                    child: Card(
                                        elevation: 5,
                                        color: Colors.grey.shade100,
                                        child: Image.network(item.product.thumbnail,height: h*0.12,)
                                    ),
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
                                          child: Text(item.product.title,overflow: TextOverflow.ellipsis,style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: h*0.019
                                          ),)),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left: w*0.013,top: h*0.015),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(item.product.brand,style: TextStyle(
                                              fontSize: h*0.018
                                          ),)),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left: w*0.013,top: h*0.015),
                                      child: Text("\$${item.product.price}",style: TextStyle(
                                          fontSize: h*0.018,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent.shade700
                                      ),),
                                    ),
                                    SizedBox(
                                      height: h*0.015,
                                    ),
                                    Text('● ${item.product.availabilityStatus}',style: TextStyle(
                                      color: stockColor,
                                      fontSize: h*0.018
                                    ),)
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(onPressed: (){
                                cartProvider.removeFromCart(item.product);
                                }, icon: Icon(Icons.delete_outline_outlined,color: Colors.red,)),
                              )
                            ],
                          ),
                        ),
                    ),
                  ),
                );
                }),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: h*0.3,
        child: Card(
          elevation: 3,
          child: Column(
        
            children: [
              Text('Order Summary',style: TextStyle(
                fontSize: h*0.025,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(
                height: h*0.02
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Subtotal',style: TextStyle(
                    fontSize: h*0.02
                  ),),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text('\$${totalprice.toStringAsFixed(2)}',style: TextStyle(
                          fontSize: h*0.02
                      ),)),
                ],
              ),

              SizedBox(
                height: h*0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Discount',style: TextStyle(
                      fontSize: h*0.02
                  ),),
                  Text('\$ ${totalDiscount.toStringAsFixed(2)}',style: TextStyle(
                      fontSize: h*0.02
                  ),)
                ],
              ),
              SizedBox(
                height: h*0.03,
                width: w*0.7,
                child: Divider(
                  thickness: 2,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Total',style: TextStyle(
                      fontSize: h*0.02,
                    fontWeight: FontWeight.bold
                  ),),
                  Text('\$ ${finalTotal.toStringAsFixed(2)}',style: TextStyle(
                      fontSize: h*0.02,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              SizedBox(
                height: h*0.025,
              ),
              Container(
                width: w*0.87,
                height: h*0.07,
                child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(h*0.015)
                  )
                ), child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock_outline,size: h*0.025,color: Colors.white,),
                    SizedBox(
                      width: w*0.05,
                    ),
                    Text('Proceed to Checkout',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: h*0.02,
                      color: Colors.white
                    ),)
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}