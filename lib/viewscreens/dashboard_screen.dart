import 'package:flutter/material.dart';
import 'package:newproject/constants/colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good evening",
                        style: TextStyle(
                          color: AppColors.black54,
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.002),
                      Text(
                        "Demo Student",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: screenWidth * 0.065,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: screenWidth * 0.12,
                    height: screenWidth * 0.12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryBlue,
                    ),
                    child: Center(
                      child: Text(
                        "DS",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.025),

              // Search Bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                height: screenHeight * 0.065,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColors.black54,
                      size: screenWidth * 0.055,
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Text(
                      "Search cities or countries...",
                      style: TextStyle(
                        color: AppColors.black38,
                        fontSize: screenWidth * 0.038,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Filter Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenWidth * 0.022,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.primaryBlue),
                    ),
                    child: Text(
                      "All",
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenWidth * 0.022,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      "Asia",
                      style: TextStyle(
                        color: AppColors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenWidth * 0.022,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      "Europe",
                      style: TextStyle(
                        color: AppColors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenWidth * 0.022,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      "Africa",
                      style: TextStyle(
                        color: AppColors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.025),

              // Cities
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cities",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    "23 results",
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: AppColors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.015),

              // City Card 1: Auckland
              Container(
                margin: EdgeInsets.only(bottom: screenHeight * 0.015),
                padding: EdgeInsets.all(screenWidth * 0.035),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.12,
                          height: screenWidth * 0.12,
                          decoration: BoxDecoration(
                            color: AppColors.cloudCardBg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.cloud_outlined,
                            color: AppColors.primaryBlue,
                            size: screenWidth * 0.07,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.035),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Auckland",
                              style: TextStyle(
                                fontSize: screenWidth * 0.042,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.003),
                            Text(
                              "New Zealand · Oceania",
                              style: TextStyle(
                                fontSize: screenWidth * 0.032,
                                color: AppColors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "15°",
                      style: TextStyle(
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.w900,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),

              // City Card 2: Bangkok
              Container(
                margin: EdgeInsets.only(bottom: screenHeight * 0.015),
                padding: EdgeInsets.all(screenWidth * 0.035),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.12,
                          height: screenWidth * 0.12,
                          decoration: BoxDecoration(
                            color: AppColors.sunnyCardBg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.wb_sunny_outlined,
                            color: AppColors.primaryBlue,
                            size: screenWidth * 0.07,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.035),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bangkok",
                              style: TextStyle(
                                fontSize: screenWidth * 0.042,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.003),
                            Text(
                              "Thailand · Asia",
                              style: TextStyle(
                                fontSize: screenWidth * 0.032,
                                color: AppColors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "33°",
                      style: TextStyle(
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.w900,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),

              // City Card 3: Buenos Aires
              Container(
                margin: EdgeInsets.only(bottom: screenHeight * 0.015),
                padding: EdgeInsets.all(screenWidth * 0.035),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.12,
                          height: screenWidth * 0.12,
                          decoration: BoxDecoration(
                            color: AppColors.sunnyCardBg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.wb_sunny_outlined,
                            color: AppColors.primaryBlue,
                            size: screenWidth * 0.07,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.035),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Buenos Aires",
                              style: TextStyle(
                                fontSize: screenWidth * 0.042,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.003),
                            Text(
                              "Argentina · South America",
                              style: TextStyle(
                                fontSize: screenWidth * 0.032,
                                color: AppColors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "19°",
                      style: TextStyle(
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.w900,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),

              // City Card 4: Cairo
              Container(
                margin: EdgeInsets.only(bottom: screenHeight * 0.015),
                padding: EdgeInsets.all(screenWidth * 0.035),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.12,
                          height: screenWidth * 0.12,
                          decoration: BoxDecoration(
                            color: AppColors.sunnyCardBg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.wb_sunny_outlined,
                            color: AppColors.primaryBlue,
                            size: screenWidth * 0.07,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.035),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cairo",
                              style: TextStyle(
                                fontSize: screenWidth * 0.042,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.003),
                            Text(
                              "Egypt · Africa",
                              style: TextStyle(
                                fontSize: screenWidth * 0.032,
                                color: AppColors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "27°",
                      style: TextStyle(
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.w900,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // More Pages
              Container(
                width: double.infinity,
                height: screenHeight * 0.06,
                decoration: BoxDecoration(
                  color: AppColors.cloudCardBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    "Load more · page 2 of 3",
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.038,
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // Navigation Menu Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.explore,
                        color: AppColors.primaryBlue,
                        size: screenWidth * 0.06,
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        "Explore",
                        style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.favorite_outline,
                        color: AppColors.black54,
                        size: screenWidth * 0.06,
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        "Favorites",
                        style: TextStyle(
                          color: AppColors.black54,
                          fontSize: screenWidth * 0.03,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: AppColors.black54,
                        size: screenWidth * 0.06,
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        "Profile",
                        style: TextStyle(
                          color: AppColors.black54,
                          fontSize: screenWidth * 0.03,
                        ),
                      ),
                    ],
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
