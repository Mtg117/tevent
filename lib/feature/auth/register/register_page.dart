import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';
import 'package:tevent/core/widget/custom-filed.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  var nameController = TextEditingController(text: "wafa");
  var emailController = TextEditingController(text: "wafa@gamil.com");
  var passwordController = TextEditingController(text: "2121");
  var confirmPasswordController = TextEditingController(text: "2121");
 final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 120,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      hintText: "Name",
                      controller: nameController,
                      prefixIcon: Icon(Icons.person),
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      controller: emailController,
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                        hintText: "Password",
                        controller: passwordController,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility_off),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'password is required';
                        }
                        if(text.length<6){
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                        ),
                    SizedBox(height: 16),
                    CustomTextField(
                        hintText: "Re-Password",
                        controller: passwordController,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility_off),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'password is required';
                        }
                         if(text.length<6){
                          return 'Password must be at least 6 characters long';
                        }
                        if(text!=passwordController.text){
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                        
                        ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(color: AppColors.blueColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          register();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryLight,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void register()async{
    if(_formKey.currentState!.validate()){
try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
    }
  
  }
}
