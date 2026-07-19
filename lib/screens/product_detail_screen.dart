import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shahz_cart_shopping_app/models/product_model.dart';
import 'package:shahz_cart_shopping_app/screens/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:intl/intl.dart';
import 'package:shahz_cart_shopping_app/providers/wish_list_provider.dart';
import 'package:shahz_cart_shopping_app/screens/favorite_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}
class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishListProvider>(context);

    bool isFavorite =
      wishlistProvider.wishlist.contains(widget.product);


    Color bgColour;
    Color txtColour;

    if (widget.product.availabilityStatus == "In Stock") {
      bgColour = Colors.green.shade100;
      txtColour = Colors.green;
    } else {
      bgColour = Colors.red.shade100;
      txtColour = Colors.red;
    }
    double discountPercent = widget.product.discountPercentage;
    Color bgColour1;
    Color txtColour1;

    if (discountPercent > 0) {
      discountPercent = discountPercent;
      bgColour1 = Colors.blueAccent.withOpacity(0.3);
      txtColour1 = Colors.blueAccent.shade700;
    } else {
      bgColour1 = Colors.transparent;
      txtColour1 = Colors.transparent;
    }

    Color favoriteColor;
    IconData favoriteIcon;
    if(isFavorite){
      favoriteIcon = Icons.favorite;
      favoriteColor = Colors.red;
    }
    else{
      favoriteIcon = Icons.favorite_outline_sharp;
      favoriteColor = Colors.red;
    }
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.product.title), centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            wishlistProvider.toggleWishlist(widget.product);
          }, icon: Icon(favoriteIcon,
      color: favoriteColor,
    ),
          )
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: widget.product.images.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  child: Card(
                    elevation: 18,
                    child: ClipRRect(
                      child: Image.network(
                        widget.product.images[index],
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 320,
                viewportFraction: 1,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: h * 0.02),

            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: widget.product.images.length,
              effect: WormEffect(
                activeDotColor: Colors.blueAccent.shade700,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
            SizedBox(height: h * 0.02),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: w * 0.03),
                    child: Container(
                      width: w * 0.4,
                      height: h * 0.03,
                      decoration: BoxDecoration(
                        color: bgColour,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          widget.product.availabilityStatus,
                          style: TextStyle(
                            color: txtColour,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: w * 0.23),
                Icon(Icons.inventory_2_outlined, color: Colors.orange),
                Text(
                  '${widget.product.stock} Items left',
                  style: TextStyle(fontSize: h * 0.018),
                ),
              ],
            ),
            SizedBox(height: h * 0.02),
            Padding(
              padding: EdgeInsets.only(left: w * 0.03),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.product.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: h * 0.025,
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.02),
            Align(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: w * 0.03),
                  child: Row(
                    children: [
                      Text(
                        'Brand: ${widget.product.brand}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: w * 0.08),
                      Text(
                        '||      Category: ${widget.product.category}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.03),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: w * 0.02),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.star, color: Colors.orange.shade300),
                  ),
                ),
                SizedBox(width: w * 0.03),
                Text(
                  '${widget.product.rating.toString()}/5',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: h * 0.02,
                    color: Colors.blueAccent.shade700,
                  ),
                ),
                SizedBox(width: w * 0.02),
                Text(
                  "(${widget.product.reviews.length.toString()} Verified Reviews)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: h * 0.02,
                    color: Colors.blueAccent.shade700,
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 0.03),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: w * 0.03),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "\$ ${widget.product.price.toString()}",
                      style: TextStyle(
                        fontSize: h * 0.025,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent.shade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: w * 0.03),
                Container(
                  width: w * 0.17,
                  height: h * 0.03,
                  decoration: BoxDecoration(
                    color: bgColour1,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    ' - ${discountPercent} %',
                    style: TextStyle(
                      fontSize: h * 0.018,
                      color: txtColour1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: (Radius.circular(20)),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        width: w * 0.46,
                        height: h * 0.15,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.local_shipping_outlined,
                              size: h * 0.04,
                              color: Colors.blueAccent.shade700,
                            ),
                            SizedBox(height: h * 0.007),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Shipping Time',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: h * 0.018,
                                ),
                              ),
                            ),

                            Text(
                              widget.product.shippingInformation,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    width: w * 0.46,
                    height: h * 0.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.workspace_premium,
                          color: Colors.orange,
                          size: h * 0.04,
                        ),
                        SizedBox(height: h * 0.007),
                        Text(
                          'Warranty',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: h * 0.018,
                          ),
                        ),
                        Text(widget.product.warrantyInformation),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(top: h*0.03),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: w * 0.03),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Quantity',
                        style: TextStyle(
                          fontSize: h * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w*0.22,
                  ),
                  Container(
                    width: w * 0.16,
                    height: h * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        if(quantity > 1){
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.only(
                            topLeft: Radius.circular(7),
                            bottomLeft: Radius.circular(7),
                          ),
                        ),
                      ),
                      child: Text(
                        '-',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: h * 0.02,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    elevation: 3,
                    child: Container(
                      width: w * 0.16,
                      height: h * 0.06,
                      child: Center(child: Text(quantity.toString())),
                    ),
                  ),
                  Container(
                    width: w * 0.16,
                    height: h * 0.06,
                    child: ElevatedButton(onPressed: (){
                      setState(() {
                        quantity++;
                      });
                    },style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.only(topRight: Radius.circular(7),bottomRight: Radius.circular(7))
                      )
                    ), child: Text('+')),
                  )
                ],
              ),
            ),
            SizedBox(
              height: h*0.03,
            ),
            SizedBox(
              height: h*0.02,
            ),
            Container(
              width: w*0.95,
              height: h*0.1,
              child: Card(

                margin: EdgeInsets.only(bottom: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(7),
                    topLeft: Radius.circular(7)
                  )
                ),
              elevation: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(

                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: h*0.03),
                          child: Icon(Icons.replay),
                        ),
                        SizedBox(
                          width: w*0.02,
                        ),
                        Text('Return Policy',style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: w*0.08),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(widget.product.returnPolicy)),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: w*0.95,
              height: h*0.1,
              child: Card(
                margin: EdgeInsets.only(bottom: 2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                elevation: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding:  EdgeInsets.only(top: h*0.03),
                          child: Icon(Icons.barcode_reader),
                        ),
                        SizedBox(
                          width: w*0.02,
                        ),
                        Text('Barcode',style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: w*0.08),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(widget.product.barcode,style: TextStyle(

                          ),)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: h * 0.03),
            Padding(
              padding: EdgeInsets.only(left: w * 0.03),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: h * 0.025,
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.02),
            Padding(
              padding: EdgeInsets.only(left: w* 0.03),
              child: Text(widget.product.description),
            ),
            SizedBox(
              height: h*0.03,
            ),
            Padding(
              padding: EdgeInsets.only(left: w* 0.03),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Text('Customer Reviews',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.025,
                      ),),
                     Text(' (${widget.product.reviews.length})',style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: h * 0.025,
                     ),)
                    ],
                  )
              ),
            ),
            SizedBox(
              height: h*0.03,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.product.reviews.length,
                itemBuilder: (context, index){
                   final review = widget.product.reviews[index];
                   final formattedDate = DateFormat('dd MMM yyy').format(DateTime.parse(review.date));
                   return Container(
                     width: w*0.9,
                     height: h*0.2,
                     child: Card(
                       elevation: 5,
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           ListTile(
                             leading: CircleAvatar(
                               radius: h*0.03,
                               backgroundColor: Colors.blueGrey.shade100,
                               child: Text(review.reviewerName[0],style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                 color: Colors.black
                               ),),
                             ),
                           title: Text(review.reviewerName,style: TextStyle(
                             fontWeight: FontWeight.bold
                           ),),
                             trailing: Row(
                               mainAxisSize: MainAxisSize.min,
                               children: List.generate(5, (index){
                                 if(index < review.rating){
                                   return Icon(Icons.star,color: Colors.amber,size: h*0.025,);
                                 }
                                 else{
                                   return Icon(Icons.star,size: h*0.025,color: Colors.grey.shade400,);

                                 }
                               })
                             ),
                             subtitle: Text(formattedDate),
                           ),
                           Padding(
                             padding:  EdgeInsets.only(left: w*0.22),
                             child: Align(
                                 alignment: Alignment.topLeft,
                                 child: Text(review.comment)),
                           )
                         ],
                       ),
                     ),
                   );
                })
          ],
        ),
      ),



    bottomNavigationBar: Container(
      height: h*0.1,
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: w*0.05),
            child: Container(
              height: h*0.06,
              width: w*0.12,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(h*0.008)
              ),
              child: IconButton(onPressed: (){

              }, icon: Icon(Icons.add_shopping_cart_outlined,size:  h*0.035,)),
            ),
          ),
          SizedBox(
            width: w*0.02,
          ),
          Container(
            height: h*0.06,
            width: w*0.37,

            child: ElevatedButton(onPressed: (){
            },style: ElevatedButton.styleFrom(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(h*0.008),
                side: BorderSide(color: Colors.blueAccent.shade700)
              )
            ), child: Text('Add to Cart',style: TextStyle(
              color: Colors.blueAccent.shade700,
                fontSize: h*0.019
            ),)),
          ),
          SizedBox(
            width: w*0.02,
          ),
          Container(
              height: h*0.06,
              width: w*0.37,
              child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(h*0.008),
                ),
                backgroundColor: Colors.blueAccent.shade700
              ), child: Text('Buy Now',style: TextStyle(
                color: Colors.white,
                fontSize: h*0.019
              ),)))
        ],
      ),
    ),

    );
  }
}
