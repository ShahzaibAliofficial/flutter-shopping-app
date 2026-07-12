import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shahz_cart_shopping_app/providers/category_provider.dart';
import 'view_all_categories.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CategoryProvider>().fetchCategories();
    });
  }
  @override
  Widget build(BuildContext context) {

    final provider = context.watch<CategoryProvider>();

    int itemCount;
    if(provider.Categories.length > 6){
      itemCount = 6;
    }
    else{
      itemCount = provider.Categories.length;
    }
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(top: h * 0.01, right: w * 0.06),
            child: Icon(Icons.notifications_none),
          ),
        ],
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: h * 0.01),
              child: Image.asset(
                'assets/images/shopping_bag.png',
                height: h * 0.06,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: h * 0.01),
              child: Text(
                'ShahzCart',
                style: GoogleFonts.aboreto(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: h * 0.03),
                child: Container(
                  width: w * 0.95,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hint: Text('Search products here !!'),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(h * 0.05),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.04),
            Container(
              width: w * 0.95,
              child: Image.asset('assets/images/home_banner.png'),
            ),
            SizedBox(height: h * 0.03),
            Container(
              width: w * 0.95,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: h * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: w * 0.48),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => allCategoriesScreen()));
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontSize: h * 0.017,
                          color: Colors.blueAccent.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h*0.15,
              child: Consumer<CategoryProvider>(
                  builder: (context, provider, child){
                    if(provider.isLoading){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(

                        scrollDirection: Axis.horizontal,
                        itemCount: itemCount,
                        itemBuilder: (context, index){
                          final category = provider.Categories[index];
        
                          return Container(
                            width: 100,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  child: Icon(Icons.category),
                                ),
                                SizedBox(height: 8,),
                                Text(category.name,textAlign: TextAlign.center,)
                              ],
                            ),
                          );
                        }
        
                    );
                  }
        
              ),
            )
          ],
        ),
      ),
    );
  }
}
