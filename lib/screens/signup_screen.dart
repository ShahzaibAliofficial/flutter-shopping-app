import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController contactController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: h * 0.08),
            child: Center(
              child: Column(
                children: [
                  Text('Create Account', style: TextStyle(fontSize: h * 0.04)),
                  Text(
                    'Fill your details to continue!!!',
                    style: TextStyle(fontSize: h * 0.022),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: h * 0.05),
          Container(
            width: w * 0.9,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter your name !!",
                prefixIcon: Icon(Icons.person),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(h * 0.02),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: h * 0.03),
          Container(
            width: w * 0.9,
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hint: Text('Enter your email !!'),
                prefixIcon: Icon(Icons.mail),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(h * 0.02),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: h * 0.03),
          Container(
            width: w * 0.9,
            child: TextField(
              controller: contactController,
              decoration: InputDecoration(
                hint: Text('Enter you phone number !!'),
                prefixIcon: Icon(Icons.phone),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(h * 0.02),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: h * 0.03),
          Container(
            width: w * 0.9,
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hint: Text('Enter Password !!'),
                prefixIcon: Icon(Icons.password),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(h * 0.02),
                ),
              ),
            ),
          ),
          SizedBox(height: h * 0.03),
          Container(
            width: w * 0.9,
            child: TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                hint: Text('Confirm Password !!'),
                prefixIcon: Icon(Icons.password),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(h * 0.02),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: h * 0.08),
          Container(
            width: w * 0.9,
            height: h * 0.06,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent.shade700,
              ),
              child: Text(
                'Create Account',
                style: TextStyle(color: Colors.white, fontSize: h * 0.025),
              ),
            ),
          ),
          SizedBox(
            height: h*0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?',style: TextStyle(
                fontSize: h*0.02
              ),),
              TextButton(onPressed: (
                  
                  ){
              }, child: Text('Login',style: TextStyle(
                fontSize: h*0.02,
                color: Colors.blueAccent.shade700
              ),))
            ],
          )
        ],
      ),
    );
  }
}
