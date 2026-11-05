import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newproject/constants/api_constant.dart';
import 'package:newproject/constants/colors.dart';
import 'package:newproject/constants/images.dart';
import 'package:newproject/controller/api_controller.dart';
import 'package:newproject/viewscreens/dashboard_screen.dart';
import 'package:newproject/viewscreens/signup_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _isObscured = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  logIn() async {
    isLoading = true;
    setState(() {});

    var emailAddress = emailController.text;
    var password = passwordController.text;

    var myBody = {'email': emailAddress, 'password': password};

    var response = await ApiController().post(
      url: ApiConstant.logInApi,
      body: myBody,
    );

    await Future.delayed(Duration(seconds: 2));
    isLoading = false;
    setState(() {});

    if (response.$1 == 201 || response.$1 == 200) {
      var logInResponse = jsonDecode(response.$2);
      String token = logInResponse['token'];
      ApiController().saveToken(token: token);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Successfully Login")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } else {
      var loginRespose = jsonDecode(response.$2);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loginRespose['message'] ?? 'Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth * 0.22,
                  height: screenWidth * 0.22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(AppImages.mainLogo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.025),
                Text(
                  "Welcome back",
                  style: TextStyle(
                    fontSize: screenWidth * 0.075,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "Log in to see weather for the cities you care about.",
                  style: TextStyle(
                    fontSize: screenWidth * 0.038,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: screenHeight * 0.035),

                // Email
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.02,
                    bottom: screenHeight * 0.01,
                  ),
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontSize: screenWidth * 0.038,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: screenWidth * 0.038,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    fillColor: AppColors.white,
                    filled: true,
                    hintText: "you@example.com",
                    hintStyle: TextStyle(
                      color: AppColors.black38,
                      fontSize: screenWidth * 0.038,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                // Password
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.02,
                    bottom: screenHeight * 0.01,
                  ),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontSize: screenWidth * 0.038,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextField(
                  textInputAction: TextInputAction.done,
                  obscureText: _isObscured,
                  controller: passwordController,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: screenWidth * 0.038,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    fillColor: AppColors.white,
                    filled: true,
                    hintText: "Enter your password",
                    hintStyle: TextStyle(
                      color: AppColors.black54,
                      fontSize: screenWidth * 0.038,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscured
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.black54,
                        size: screenWidth * 0.05,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.065,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: logIn,
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: AppColors.white,
                          )
                        : Text(
                            "Log in",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.035),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New to Nimbus? ",
                        style: TextStyle(
                          color: AppColors.black54,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Create account",
                          style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
}
