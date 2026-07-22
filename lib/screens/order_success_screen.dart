import 'package:flutter/material.dart';
import 'date:math';
class OrderSuccessScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

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
                      CircleAvatar(
                        backgroundColor: Colors.green.shade100,
                        radius: h*0.03,
                        child: Icon(Icons.shopping_bag_outlined,color: Colors.green.shade600,size: h*0.035,),
                      ),
                      Column(
                        children: [
                          Text('Order ID')
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}