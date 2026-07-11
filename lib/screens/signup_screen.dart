import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signin_screen.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isPasswordHidden = true;
  bool isPasswordHidden1 = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose(){
    nameController.dispose();
    emailController.dispose();
    contactController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
}
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    IconData passwordIcon;
    if(isPasswordHidden){
      passwordIcon = Icons.visibility_off;
    }
    else{
      passwordIcon = Icons.visibility;
    }
    IconData confirmPassword;

    if(isPasswordHidden1){
      confirmPassword = Icons.visibility_off;
    }
    else{
      confirmPassword = Icons.visibility;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                keyboardType: TextInputType.emailAddress,
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
                keyboardType: TextInputType.phone,
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
                obscureText: isPasswordHidden,
                decoration: InputDecoration(
                  hint: Text('Enter Password !!'),
                  prefixIcon: Icon(Icons.password),
                  filled: true,
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      isPasswordHidden = !isPasswordHidden;
                    });
                  }, icon: Icon(passwordIcon)),
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
                obscureText: isPasswordHidden1,
                decoration: InputDecoration(
                  hint: Text('Confirm Password !!'),
                  prefixIcon: Icon(Icons.password),
                  filled: true,
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      isPasswordHidden1 = !isPasswordHidden1;
                    });
                  }, icon: Icon(confirmPassword)),
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
                onPressed: () async{
                  if(nameController.text.isEmpty ||
                     emailController.text.isEmpty ||
                     contactController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      confirmPasswordController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all the required fields !!!')
                    )
                    );
                    return;
                  }
                  final email = emailController.text.trim();

                  if(!email.contains('@')|| !email.contains('.')){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('enter valid email !!!')
                    )
                    );
                    return;
                  }
                  if(contactController.text.length !=11){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('phone number must be 11 digits !!!')
                    )
                    );
                    return;
                  }
                  if(passwordController.text.length <6){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('password must be atleast 6 characters !!!')
                    )
                    );
                    return;
                  }
                  if(passwordController.text != confirmPasswordController.text){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password don't match")
                    )
                    );
                  }
                  final prefs =await SharedPreferences.getInstance();

                  await prefs.setString('name', nameController.text.trim());

                  await prefs.setString('email', emailController.text.trim());

                  await prefs.setString('contact', contactController.text.trim());

                  await prefs.setString('password', passwordController.text);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account created successfully !!!')
                  )
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
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
      ),
    );
  }
}
