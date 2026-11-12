import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/constants/colors.dart';
import 'package:newproject/controller/home_controller.dart';
import 'package:newproject/model/cities_weather_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final HomeController controller = Get.put(HomeController());

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
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black54,
                      ),
                      children: [
                        const TextSpan(text: "Good evening\n"),
                        TextSpan(
                          text: controller.name.value,
                          style: TextStyle(
                            fontSize: screenWidth * 0.065,
                            fontWeight: FontWeight.w900,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => CircleAvatar(
                      radius: screenWidth * 0.06,
                      backgroundColor: AppColors.primaryBlue,
                      child: Text(
                        controller.getInitials(),
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
              TextField(
                style: TextStyle(
                  color: AppColors.black54,
                  fontSize: screenWidth * 0.038,
                ),
                decoration: InputDecoration(
                  hintText: "Search cities or countries...",
                  hintStyle: TextStyle(
                    color: AppColors.black38,
                    fontSize: screenWidth * 0.038,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.black54,
                    size: screenWidth * 0.055,
                  ),
                  filled: true,
                  fillColor: AppColors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Filter Categories
              SingleChildScrollView(
                child: Obx(
                  () => SizedBox(
                    height: screenWidth * 0.12,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        final bool isSelected =
                            controller.selectedIndex.value == index;

                        return Padding(
                          padding: EdgeInsets.only(right: screenWidth * 0.03),
                          child: TextButton(
                            onPressed: () {
                              controller.selectedIndex.value = index;
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: isSelected
                                  ? AppColors.primaryBlue
                                  : AppColors.white,
                              foregroundColor: isSelected
                                  ? AppColors.white
                                  : AppColors.black87,
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05,
                                vertical: screenWidth * 0.022,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: isSelected
                                      ? AppColors.primaryBlue
                                      : Colors.grey.shade300,
                                ),
                              ),
                            ),
                            child: Text(
                              controller.categories[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.025),

              // Section Header
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
                    "${controller.cities.length} results",
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: AppColors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.015),

              // Cities List
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount:
                        controller.cities.length + (controller.hasNext ? 1 : 0),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index == controller.cities.length &&
                          controller.hasNext) {
                        return GestureDetector(
                          onTap: controller.getCitiesDetails,
                          child: Container(
                            width: double.infinity,
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              color: AppColors.cloudCardBg,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                "Load more page",
                                style: TextStyle(
                                  color: AppColors.primaryBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.038,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      Datum city = controller.cities[index];
                      return Container(
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
                                    color: AppColors.backgroundLight,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.cloud,
                                    color: Colors.blueAccent,
                                    size: screenWidth * 0.07,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.035),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      city.name!,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.042,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.003),
                                    Text(
                                      "${city.country} · ${city.region}",
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
                              city.weather!.temperatureC!.toStringAsFixed(0),
                              style: TextStyle(
                                fontSize: screenWidth * 0.055,
                                fontWeight: FontWeight.w900,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
