import 'package:get/get.dart';

class GetValuesController extends GetxController {
  RxString description = ''.obs;
  RxString city = 'Faialabad'.obs;
  RxString main = ''.obs;
  RxDouble wind = 1.0.obs;
  RxDouble temp = 1.0.obs;
  RxInt humidity = 1.obs;
  RxInt id = 1.obs;
  RxInt cloud = 1.obs;
  var isLoading = false.obs;

  giveData(Map<String, dynamic> json) {
    main.value = json['weather'][0]['main'];
    description.value = json['weather'][0]['description'];
    city.value = json['name'];
    humidity.value = json['main']['humidity'];
    temp.value = json['main']['temp'];
    wind.value = json['wind']['speed'];
    cloud.value = json['clouds']['all'];
    id.value = json['weather'][0]['id'];
  }
}
