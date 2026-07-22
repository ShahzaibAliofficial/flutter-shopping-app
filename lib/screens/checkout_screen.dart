import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shahz_cart_shopping_app/providers/cart_item_provider.dart';
import 'package:provider/provider.dart';
import 'product_detail_screen.dart';
import 'order_success_screen.dart';


class CheckoutScreen  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    final cartProvider = Provider.of<CartItemProvider>(context);
    double totalprice = 0;
    for (var item in cartProvider.cart) {
      totalprice += item.product.price * item.quantity;
    }
    double totalDiscount = 0;
    for (var item in cartProvider.cart) {
      totalDiscount +=
          (item.product.price * item.product.discountPercentage / 100) *
              item.quantity;
    }
    double finalTotal = totalprice - totalDiscount;

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout',style: GoogleFonts.abrilFatface(),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: w*0.029),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Shipping Address',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: h*0.02
                  ),)),
            ),
            SizedBox(
              height: h*0.01,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: w*0.95 ,
                height: h*0.23,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(h*0.015)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(bottom: h*0.04),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Icon(Icons.location_on_sharp,color: Colors.blueAccent.shade700,size: h*0.03,)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top: h*0.02,left: w*0.015),
                              child: Text('Shahzaib Ali',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left:w*0.015 ),
                              child: Text('House # C317, Street 45, Block 6'),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left:w*0.015 ),
                              child: Text('Gulshan-e-Iqbal, Karachi'),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left:w*0.015 ),
                              child: Text('Sindh,Pakistan-75003'),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left:w*0.015 ),
                              child: Text('+92 334-3963103'),
                            ),
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: w*0.2),
                          child: Icon(Icons.arrow_forward_ios_rounded,size: h*0.02,color: Colors.grey.shade600,),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h*0.015,
                    ),
                    Divider(),
                    TextButton(onPressed: (){

                    }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,color: Colors.blueAccent.shade700,size: h*0.025,),
                        SizedBox(
                          width: w*0.02,
                        ),
                        Text('Add New Address',style: TextStyle(
                          fontSize: h*0.02,
                          color: Colors.blueAccent.shade700
                        ),)
                      ],
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h*0.015,
            ),
            Padding(
              padding:  EdgeInsets.only(left: w*0.029),
              child: Text('Payment Method',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: h*0.02
              ),),
            ),
            SizedBox(
              height: h*0.01,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: w*0.95 ,
                height: h*0.08,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueAccent.shade700
                  ),
                  borderRadius: BorderRadius.circular(h*0.015)
                ),
                child: Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.blueAccent.shade700,
                      onChanged: (value){},
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cash on Delivery',style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        Text('Pay when you receive your order...')
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h*0.015,
            ),
            Padding(
              padding:  EdgeInsets.only(left: w*0.029),
              child: Text('Order Items',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: h*0.02
              ),),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartProvider.cart.length,
                itemBuilder: (context, index){
                  final item = cartProvider.cart[index];
                  final double totalItemPrice = item.product.price * item.quantity;
                  return Padding(
                    padding:  EdgeInsets.only(bottom: h*0.005),
                    child: Center(
                      child: Container(
                        width: w*0.95,
                        height: h*0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(h*0.01),
                          border: Border.all(
                            color: Colors.grey.shade400
                          ),
                        ),
                        child: Row(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Image.network(item.product.thumbnail)
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(item.product.title,style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),),
                                Text(item.product.brand),
                                Text('\Qty: ${item.quantity}')
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding:  EdgeInsets.only(right: w*0.02),
                              child: Text('\$ ${totalItemPrice.toStringAsFixed(2)}',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                            )
                          ],

                        ),
                      ),
                    ),
                  );
                }),
                Center(
                  child: Container(
                    width: w*0.95,
                    height: h*0.03,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400
                      ),
                      borderRadius: BorderRadius.circular(h*0.01)
                    ),
                    child: Center(child: Text('Total Items : ${cartProvider.cart.length}',style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),)),
                  ),
                )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.all(12),
        child: Container(
          width: w*0.95,
          height: h * 0.3,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade400
            ),
            borderRadius: BorderRadius.circular(h*0.01)
          ),
          child:  Column(
              children: [
                Text(
                  'Order Summary',
                  style: TextStyle(
                    fontSize: h * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: h * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Subtotal', style: TextStyle(fontSize: h * 0.02)),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        '\$${totalprice.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: h * 0.02),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Discount', style: TextStyle(fontSize: h * 0.02)),
                    Text(
                      '\$ ${totalDiscount.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: h * 0.02,
                          color: Colors.red
                      ),

                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.03,
                  width: w * 0.7,
                  child: Divider(thickness: 2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$ ${finalTotal.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: h * 0.02,
                          fontWeight: FontWeight.bold,
                          color: Colors.green
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h * 0.025),
                Container(
                  width: w * 0.9,
                  height: h * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OrderSuccessScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(h * 0.015),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock_outline,
                          size: h * 0.025,
                          color: Colors.white,
                        ),
                        SizedBox(width: w * 0.02),
                        Text(
                          'Place Order',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: h * 0.02,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Text('\$ ${finalTotal.toStringAsFixed(1)}',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: h * 0.02,
                        ),)
                      ],
                    ),
                  ),
                ),
              ],
            ),

        ),
      ),
    );
  }
}