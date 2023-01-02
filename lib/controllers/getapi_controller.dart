import 'dart:convert';
import 'dart:developer';
import 'package:flutterp/const.dart';
import 'package:flutterp/controllers/getvalues_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../models/datamodel.dart';

class GetApiController extends GetxController {
  var getValuesController = Get.find<GetValuesController>();
  var isLoading = false.obs;
  static String initaialdate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  var list = <Datamodel>[].obs;
  var matchedList = <Data>[].obs;
  int num = 0;
  RxString selectedDate = initaialdate.obs;
  static double lat = 31.386863;
  static double lon = 73.1069666;
  String urlDay =
      'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=7d51073a52b733412913f896bee81c54&units=metric';
  String urlLocation =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=7d51073a52b733412913f896bee81c54&units=metric";

  getLocation() async {
    try {
      await Geolocator.requestPermission();
      getValuesController.isLoading(true);
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          forceAndroidLocationManager: true);
      lat = position.latitude;
      lon = position.longitude;
      log(lat.toString());
      log(lon.toString());
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(),
          colorText: white,
          duration: const Duration(seconds: 4),
          backgroundGradient: gradientBg);
    }
  }

  locationResponse() async {
    getValuesController.isLoading(true);
    var response = await http.get(Uri.parse(urlLocation));
    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body);
      getValuesController.giveData(data);
    } else {
      log(response.statusCode.toString());
    }
    getValuesController.isLoading(false);
  }

  getResponse() async {
    try {
      isLoading(true);
      list.clear();
      matchedList.clear();
      var response = await http.get(Uri.parse(urlDay));
      if (response.statusCode == 200) {
        log('200');
        var allData = jsonDecode(response.body);
        for (var i = 0; i < 40; i++) {
          var data = Datamodel.fromJson(allData);
          list.add(data);
          if (list[0].list![i].dt == selectedDate.value) {
            matchedList.add(list[0].list![i]);
          }
        }
      } else {
        log(response.statusCode.toString());
      }
      isLoading(false);
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(),
          colorText: white,
          duration: const Duration(seconds: 4),
          backgroundGradient: gradientBg);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getLocation();
    locationResponse();
    getResponse();
  }
}
