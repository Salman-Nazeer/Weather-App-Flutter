import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/constants/api_constant.dart';
import 'package:newproject/constants/colors.dart';
import 'package:newproject/controller/api_controller.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getRegionDetails();
    // TODO: implement onInit
    super.onInit();
  }

  // Function to get initials from full name
  RxString name = "Salman Nazeer".obs;
  String getInitials() {
    List<String> parts = name.value.trim().split(' ');

    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    } else if (parts.isNotEmpty && parts[0].isNotEmpty) {
      return parts[0][0].toUpperCase();
    }
    return '';
  }

  RxList<String> categories = ["All"].obs;

  RxInt selectedIndex = 0.obs;

  // Cities data
  RxList cities = [
    {
      "name": "Auckland",
      "country": "New Zealand",
      "region": "Oceania",
      "temperature": "15°",
      "icon": Icons.cloud_outlined,
      "tileColor": AppColors.cloudCardBg,
      "iconColor": AppColors.primaryBlue,
    },
    {
      "name": "Bangkok",
      "country": "Thailand",
      "region": "Asia",
      "temperature": "33°",
      "icon": Icons.wb_sunny_outlined,
      "tileColor": AppColors.sunnyCardBg,
      "iconColor": Colors.orange,
    },
    {
      "name": "Buenos Aires",
      "country": "Argentina",
      "region": "South America",
      "temperature": "19°",
      "icon": Icons.wb_sunny_outlined,
      "tileColor": AppColors.sunnyCardBg,
      "iconColor": Colors.orange,
    },
    {
      "name": "Cairo",
      "country": "Egypt",
      "region": "Africa",
      "temperature": "27°",
      "icon": Icons.wb_sunny_outlined,
      "tileColor": AppColors.sunnyCardBg,
      "iconColor": Colors.orange,
    },
  ].obs;

  Future<void> getRegionDetails() async {
    var response = await ApiController().get(url: ApiConstant.regionApi);

    try {
      if (response.$1 == 201 || response.$1 == 200) {
        var regionRespone = jsonDecode(response.$2)['data'];
        for (var i in regionRespone) {
          categories.add(i["name"]);
        }
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
