import 'package:flutter/material.dart';
import 'package:newproject/constants/api_constant.dart';
import 'package:newproject/constants/colors.dart';
import 'package:newproject/controller/api_controller.dart';
import 'package:newproject/viewscreens/dashboard_screen.dart';

import 'loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    onInItCalled();
    super.initState();
  }

  Future<void> onInItCalled() async {
    var response = await ApiController().get(
      url: ApiConstant.rememberMeApi,
      isToken: true,
    );
    if (response.$1 == 201 || response.$1 == 200) {
      var route = MaterialPageRoute(
        builder: (context) => const DashboardScreen(),
      );
      Navigator.pushReplacement(context, route);
    } else {
      var route = MaterialPageRoute(builder: (context) => const LogInPage());
      Navigator.pushReplacement(context, route);
    }
    // await Future.delayed(const Duration(seconds: 2));
  }

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
