import 'dart:convert';

import 'package:get/get.dart';
import 'package:newproject/constants/api_constant.dart';
import 'package:newproject/controller/api_controller.dart';
import 'package:newproject/controller/auth_controller.dart';
import 'package:newproject/model/cities_weather_model.dart';

class HomeController extends GetxController {
  final AuthController authController = Get.find<AuthController>();
  // Function to get initials from full name@override
  RxString name = "".obs; // Initialize empty or with a fallback
  @override
  void onInit() {
    // Extract name from authController's logInResponse
    if (authController.logInResponse.isNotEmpty &&
        authController.logInResponse["user"] != null) {
      name.value = authController.logInResponse["user"]["name"] ?? "User";
    } else {
      name.value = "Demo Student"; // Fallback default name
    }

    getRegionDetails();
    getCitiesDetails();

    // TODO: implement onReady
    super.onInit();
  }

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

  RxInt selectedRegionIndex = 0.obs;
  RxBool isRegionLoading = false.obs;

  void regionTap(int index) {
    selectedRegionIndex.value = index;
    print(categories[selectedRegionIndex.value]);
    getCitiesDetails(reset: true);
  }

  Future<void> getRegionDetails() async {
    isRegionLoading.value = true;

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
    } finally {
      isRegionLoading.value = false;
    }
  }

  // Cities data
  RxList<dynamic> cities = [].obs;
  bool hasNext = true;
  int cityPage = 1;
  bool isCitiesLoading = false;

  Future<void> getCitiesDetails({bool reset = false}) async {
    Map<String, String> queryParams = {};
    if (reset) {
      cities.clear();
      hasNext = true;
      cityPage = 1;
      isCitiesLoading = false;
    }

    queryParams.addAll({'page': cityPage.toString(), 'limit': '8'});

    if (selectedRegionIndex.value != 0) {
      queryParams.addAll({'region': categories[selectedRegionIndex.value]});
    }

    if (isCitiesLoading || !hasNext) return;
    isCitiesLoading = true;
    update();

    try {
      var response = await ApiController().get(
        url: ApiConstant.cityApi,
        queryParams: queryParams,
      );
      if (response.$1 == 201 || response.$1 == 200) {
        final citiesWeather = citiesWeatherFromJson(response.$2);
        if (citiesWeather.data != null) {
          cities.addAll(citiesWeather.data!);
          hasNext = citiesWeather.meta!.hasNext!;
          cityPage++;
        }
      }
    } catch (e) {
      print("Error $e");
    } finally {
      isCitiesLoading = false;
      update();
    }
  }
}
