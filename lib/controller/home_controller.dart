import 'dart:convert';

import 'package:get/get.dart';
import 'package:newproject/constants/api_constant.dart';
import 'package:newproject/controller/api_controller.dart';
import 'package:newproject/model/cities_weather_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getRegionDetails();
    getCitiesDetails();
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

  // Cities data
  RxList<dynamic> cities = [].obs;
  bool hasNext = true;
  int cityPage = 1;

 

  Future<void> getCitiesDetails() async {
    try {
      var response = await ApiController().get(
        url: ApiConstant.cityApi(cityPage),
      );
      if (response.$1 == 201 || response.$1 == 200) {
        final citiesWeather = citiesWeatherFromJson(response.$2);
        print(citiesWeather.data);
        if (citiesWeather.data != null) {
          cities.addAll(citiesWeather.data!);
          hasNext = citiesWeather.meta!.hasNext!;
          cityPage++;
    print("pages in in cities   $cityPage");

        }
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
