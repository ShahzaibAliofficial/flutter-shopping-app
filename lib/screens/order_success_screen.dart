import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shahz_cart_shopping_app/screens/home_screen.dart';


class OrderSuccessScreen extends StatelessWidget{
  final String orderId;
  final int totalItem;
  const OrderSuccessScreen({super.key, required this.orderId, required this.totalItem});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    String currentDate = DateFormat('MMM d yyyy').format(DateTime.now());
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: h*0.05),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                backgroundColor: Colors.green.shade50,
                radius: h*0.08,
                child: Icon(Icons.check,size: h*0.1,color: Colors.green,),
              ),
            ),
            Center(
                child: Text('Order Placed Successfully!',style: TextStyle(
                  color: Colors.green.shade800,
                  fontSize: h*0.03,
                  fontWeight: FontWeight.bold
                ),)),
            Text('Thank you for your purchase.\nYour order has been placed successfully',textAlign: TextAlign.center,style: TextStyle(
              fontSize: h*0.018,
              color: Colors.green.shade800
            ),),
            SizedBox(
              height: h*0.02,
            ),
            Container(
              width: w*0.9,
              height: h*0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(h*0.01),
                border: Border.all(
                  color: Colors.green.shade200
                )
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: w*0.025),
                        child: CircleAvatar(
                          backgroundColor: Colors.green.shade100,
                          radius: h*0.03,
                          child: Icon(Icons.shopping_bag_outlined,color: Colors.green.shade600,size: h*0.035,),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: w*0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Order ID',style: TextStyle(
                              color: Colors.green.shade800
                            ),),
                            Text(orderId,style: TextStyle(
                              color: Colors.green.shade800,
                              fontSize: h*0.02
                            ),)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: w*0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green.shade100,
                            radius: h*0.03,
                            child: Icon(Icons.calendar_month_outlined,size: h*0.035,color: Colors.green.shade600,),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: w*0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Order Date',style: TextStyle(
                                  color: Colors.green.shade800
                                ),),
                                Text(currentDate,style: TextStyle(
                                  fontSize: h*0.02,
                                  color: Colors.green.shade800
                                ),)
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: h*0.04,
            ),
            Container(
              width: w*0.9,
              height: h*0.2 ,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green.shade200
                ),
                borderRadius: BorderRadius.circular(h*0.01)
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:  EdgeInsets.only(left: w*0.03),
                      child: Text('Order Details',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: h*0.025
                      ),),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: h*0.02),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: h*0.033,
                                backgroundColor: Colors.green.shade100,
                                child: Icon(Icons.inventory_2_outlined,color: Colors.green.shade700,size: h*0.035,),
                              ),
                              Text('Total Items',style: TextStyle(
                                fontSize: h*0.02
                              ),),
                              Text('${totalItem.toStringAsFixed(0)} Items',style: TextStyle(
                                color: Colors.green.shade900,
                                fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                          VerticalDivider(
                            color: Colors.green.shade800,
                            thickness: w*0.001,

                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: h*0.033,
                                backgroundColor: Colors.green.shade100,
                                child: Icon(Icons.credit_card_outlined,color: Colors.green.shade700,size: h*0.035,),
                              ),
                              Text('Payment Method',style: TextStyle(
                                  fontSize: h*0.02
                              ),),
                              Text('Cash on Delivery',style: TextStyle(
                                  color: Colors.green.shade900,
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: h*0.05,
            ),
            Container(
              width: w*0.9,
              height: h*0.05,
              child: ElevatedButton(onPressed: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomeScreen()),
                  (Route<dynamic> route) => false
                );
              },style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(h*0.01)
                )
              ), child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home,color: Colors.white,size: h*0.03,),
                  SizedBox(
                    width: w*0.02,
                  ),
                  Text('Back to Home',style: TextStyle(
                    color: Colors.white,
                    fontSize: h*0.023
                  ),)
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}