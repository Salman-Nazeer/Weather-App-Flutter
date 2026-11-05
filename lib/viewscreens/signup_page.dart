import 'package:flutter/material.dart';
import 'package:newproject/constants/colors.dart';
import 'package:newproject/constants/images.dart';

import 'loginpage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscured = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                  "Create your account",
                  style: TextStyle(
                    fontSize: screenWidth * 0.075,
                    fontWeight: FontWeight.w900,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  "Save cities and notes, and sync them on every device.",
                  style: TextStyle(
                    fontSize: screenWidth * 0.038,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black54,
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                // Full Name
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.02,
                    bottom: screenHeight * 0.01,
                  ),
                  child: Text(
                    "Full name",
                    style: TextStyle(
                      fontSize: screenWidth * 0.038,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black87,
                    ),
                  ),
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: screenWidth * 0.038,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    fillColor: AppColors.white,
                    filled: true,
                    hintText: "A",
                    hintStyle: TextStyle(
                      color: AppColors.black38,
                      fontSize: screenWidth * 0.038,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.02,
                    top: screenHeight * 0.005,
                  ),
                  child: Text(
                    "Name must be at least 2 characters.",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

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
                      color: AppColors.black87,
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
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    fillColor: AppColors.white,
                    filled: true,
                    hintText: "sara@",
                    hintStyle: TextStyle(
                      color: AppColors.black38,
                      fontSize: screenWidth * 0.038,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.02,
                    top: screenHeight * 0.005,
                  ),
                  child: Text(
                    "Enter a valid email.",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: screenWidth * 0.03,
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
                      color: AppColors.black87,
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
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    fillColor: AppColors.white,
                    filled: true,
                    hintText: "•••••",
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
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.02,
                    top: screenHeight * 0.005,
                  ),
                  child: Text(
                    "Password must be at least 8 characters.",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                // Create Account Button
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
                    onPressed: () {},
                    child: Text(
                      "Create account",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.035),

                // Footer Navigation back to Login
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
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
                              builder: (context) => const LogInPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Log in",
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
