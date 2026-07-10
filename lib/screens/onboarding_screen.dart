import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'signup_screen.dart';

class OnBoardingScreen extends StatefulWidget{
OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  int currentIndex = 0;

  final List<Map<String,dynamic>> onboardingData = [
    {'image': 'assets/images/onboarding1.png',
      'title': 'Stylish & Trendy Collection',
      'subtitle': 'Discover amazing products handpicked by you.'
    },
    {
      'image': 'assets/images/onboarding2.png',
      'title': 'Best Quality \n Products',
      'subtitle': 'Premium quality products at the best prices.'
    },
    {
      'image': 'assets/images/onboarding3.png',
      'title': 'Fast & Secure \n Delivery',
      'subtitle': 'Get your order delivered fast and safely.'
    }
  ];
  void dispose(){
    _controller.dispose();

    super.dispose();
}
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    Widget buttonSection;
  if(currentIndex == onboardingData.length -1){
    buttonSection = Padding(
      padding: EdgeInsets.only(bottom: h*0.03),
      child: Container(
        width: w*0.7,
        height: h*0.06,
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
            },style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent.shade700
        ), child: Text('Get Started',style: TextStyle(
          color: Colors.white,
          fontSize: h*0.025
        ),)),
      ),
    );
  }
  else{
    buttonSection = Padding(
      padding:  EdgeInsets.only(bottom: h*0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: w*0.07),
            child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
            }, child: Text('Skip',style: TextStyle(
              color: Colors.black,
              fontSize: h*0.025
            ),)
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(right: w*0.07),
            child: ElevatedButton(onPressed: (){
              _controller.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.linearToEaseOut);
            },style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent.shade700
            ), child: Text('Next',style: TextStyle(
              color: Colors.white,
              fontSize: h*0.02
            ),)),
          )
        ],
      ),
    );
  }
    return Scaffold(
    body:SafeArea(
        child: Column(
        children: [
          Expanded(
              child: PageView.builder(
                  controller: _controller,
                  itemCount: onboardingData.length,
                  onPageChanged: (index){
                    setState(() {
                      currentIndex = index;
                    });
                  },
                itemBuilder: (context, index){
                    return Padding(
                      padding:  EdgeInsets.only(top: h*0.03),
                      child: Column(
                        children: [
                          Image.asset(
                           onboardingData[index]['image']!,
                          ),
                          Text(
                              onboardingData[index]['title']!,
                          textAlign: TextAlign.center,
                            style: GoogleFonts.abel(
                              fontSize: h*0.05,                          ),
                          ),
                          SizedBox(
                            height: h*0.04,
                          ),
                          Text(onboardingData[index]['subtitle'],
                          textAlign: TextAlign.center,
                            style: GoogleFonts.aBeeZee(
                              fontSize: h*0.025
                            ),
                          ),
                          SizedBox(
                            height: h*0.06,
                          ),
                          SmoothPageIndicator(
                              controller: _controller,
                              count: onboardingData.length,
                              effect: WormEffect(
                                activeDotColor: Colors.blueAccent.shade700,
                                dotHeight: 10,
                                dotWidth: 10,
                                spacing: 15
                              ),
                          ),
                          SizedBox(
                            height: h*0.02,
                          ),

                        ],
                      ),
                    );
                },
              ),
    ),
          buttonSection
        ],
    )),
    );
  }
}