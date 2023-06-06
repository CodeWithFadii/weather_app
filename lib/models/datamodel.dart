import 'package:intl/intl.dart';

class Datamodel {
  List<Data>? list;

  Datamodel({this.list});

  Datamodel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <Data>[];
      json['list'].forEach((v) {
        list!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  Main? main;
  String? dt;
  List<Weather>? weather;
  int? visibility;
  num? pop;
  String? dtTxt;

  Data({this.dt, this.visibility, this.pop, this.dtTxt, this.main});

  Data.fromJson(Map<String, dynamic> json) {
    dt = DateFormat('dd-MM-yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000));
    main =  Main.fromJson(json['main']) ;

    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    visibility = json['visibility'];
    pop = json['pop'];
    dtTxt = json['dt_txt'];
  }
}

class Main {
  num? temp;
  num? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;

  Main({
    this.temp,
    this.humidity,
  });

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    humidity = json['humidity'];
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}
