import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_app/View/Home/home_screen.dart';

import 'Widgets/button.dart';
import 'Widgets/slide_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String? merchantId;
  String? password;
  String? phoneNumber;
  PageController pageController = PageController();
  int pageIndex = 1;
  bool isObscure = true;
  bool isRememberMe = false;

  //controllers

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          title: const Text("SocialX"),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SlideButton(
                pageController: pageController,
                pageIndex: pageIndex,
                labelFirst: "LOGIN",
                labelSecond: "SIGNUP",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .74,
                child: PageView(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  controller: pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  children: [
                    loginView(size),
                    signUpView(size),
                  ],
                ),
              ),
              SubmitButton(
                title: "Submit",
                onTap: () async {
                  if (pageIndex == 0) {
                    //login Button functionality
                    log("Login Clicked");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  }
                  // FSM Submit button
                  else if (pageIndex == 1) {
                    //signUp Button functionality
                    log("Signup Clicked");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  }
                },
              ),
            ],
          ),
        ));
  }

  /// LOGIN  PAGE
  Widget loginView(Size size) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pageTitle(title: "SignIn into Your Account"),
            customTextFormField(
                label: "Email",
                hintText: "abc@gmail.com",
                controller: emailController,
                suffixIcon: Icons.email),
            customTextFormField(
                label: "Password",
                hintText: "Password",
                controller: passwordController,
                suffixIcon: Icons.lock_outline),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    log("Forgot Password Clicked");
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customTextFormField(
      {String? label, String? hintText, TextEditingController? controller, IconData? suffixIcon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            label: Text("$label"),
            hintText: hintText,
            suffixIcon: Icon(suffixIcon, color: Colors.red)),
      ),
    );
  }

  ///LOGIN  PAGE
  Widget signUpView(Size size) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pageTitle(title: "Create an Account"),
                customTextFormField(
                    label: "Name",
                    hintText: "Sha Mittal",
                    controller: nameController,
                    suffixIcon: Icons.person),
                customTextFormField(
                    label: "Email",
                    hintText: "abc@gmail.com",
                    controller: emailController,
                    suffixIcon: Icons.email),
                customTextFormField(
                    label: "Contact No.",
                    hintText: "9876543210",
                    controller: contactController,
                    suffixIcon: Icons.person),
                customTextFormField(
                    label: "Password",
                    hintText: "Password",
                    controller: passwordController,
                    suffixIcon: Icons.lock_outline_rounded),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isRememberMe,
                            onChanged: (value) {
                              setState(() {
                                isRememberMe = !isRememberMe;
                              });
                            },
                          ),
                          RichText(
                            text: const TextSpan(
                                text: "I agree with ",
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: "term & Conditions",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red))
                                ]),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text pageTitle({required String title}) {
    return Text(title,
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25));
  }
}
