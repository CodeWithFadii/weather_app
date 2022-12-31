import 'dart:convert';
import 'dart:developer';
import 'package:flutterp/controllers/getvalues_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetApiController extends GetxController {
  var getValuesController = Get.find<GetValuesController>();
  static double lat = 31.386863;
  static double lon = 73.1069666;
  String urlLocation =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=7d51073a52b733412913f896bee81c54&units=metric";

  getLocation() async {
    await Geolocator.requestPermission();
    getValuesController.isLoading(true);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        forceAndroidLocationManager: true);
    lat = position.latitude;
    lon = position.longitude;
    log(lat.toString());
    log(lon.toString());
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


  @override
  void onInit() async {
    super.onInit();
    await getLocation();
      locationResponse();
  }
}
