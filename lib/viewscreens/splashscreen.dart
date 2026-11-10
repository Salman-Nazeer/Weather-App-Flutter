import 'package:flutter/material.dart';
import 'package:newproject/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Nimbus",
              style: TextStyle(
                color: AppColors.white,
                fontSize: screenWidth * 0.12,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "Weather & city guid",
              style: TextStyle(
                color: AppColors.white,
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            const CircularProgressIndicator(color: AppColors.blueGrey),
          ],
        ),
      ),
    );
  }
}
