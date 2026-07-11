import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordHiddenLogin = true;

  TextEditingController emailOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void dispose() {
    emailOrPhoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    IconData passwordIconLogin;
    if (isPasswordHiddenLogin) {
      passwordIconLogin = Icons.visibility_off;
    } else {
      passwordIconLogin = Icons.visibility;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: h * 0.1),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: w * 0.25),
                child: Text(
                  'Welcome Back 👋',
                  style: TextStyle(
                    fontSize: h * 0.034,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: w * 0.45),
                child: Text(
                  'Login to Continue',
                  style: TextStyle(fontSize: h * 0.022),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.05),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: w * 0.9,
                        child: TextField(
                          controller: emailOrPhoneController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            hint: Text('Enter email or phone'),
                            prefixIcon: Icon(Icons.person_2_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(h * 0.02),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.05),
                      Container(
                        width: w * 0.9,
                        child: TextField(
                          controller: passwordController,
                          obscureText: isPasswordHiddenLogin,
                          decoration: InputDecoration(
                            filled: true,
                            hint: Text('Enter password '),
                            prefixIcon: Icon(Icons.password),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordHiddenLogin =
                                      !isPasswordHiddenLogin;
                                });
                              },
                              icon: Icon(passwordIconLogin),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(h * 0.02),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: h * 0.05),
              Container(
                width: w * 0.9,
                height: h * 0.06,
                child: ElevatedButton(
                  onPressed: () async{
                    if (emailOrPhoneController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Please fill all the required fields !!!",
                          ),
                        ),
                      );
                    }
                    final prefs = await SharedPreferences.getInstance();

                    final savedEmail = prefs.getString('email');
                    final savedContact = prefs.getString('contact');
                    final savedPassword = prefs.getString('password');

                    final input = emailOrPhoneController.text.trim();
                    final password = passwordController.text;

                    if((input == savedEmail || input == savedContact) && password == savedPassword){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successfully !!!',style: TextStyle(
                        color: Colors.green
                      ),)
                      )
                      );
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter valid email/contact or password ")
                      )
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent.shade700,
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: h * 0.025),
                  ),
                ),
              ),
              SizedBox(height: h * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: h * 0.02),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: h * 0.02,
                        color: Colors.blueAccent.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
