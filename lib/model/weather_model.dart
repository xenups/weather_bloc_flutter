import 'package:flutter/cupertino.dart';

class WeatherModel {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  double pressure;
  double humidity;

  WeatherModel.fromJson(Map<String, dynamic> json) {
    this.temp = json["temp"].toDouble()-273;
    this.feelsLike = json["feels_like"].toDouble()-273;
    this.tempMin = json["temp_min"].toDouble()-273;
    this.tempMax = json["temp_max"].toDouble();
    this.pressure = json["pressure"].toDouble();
    this.humidity = json["humidity"].toDouble();
  }

  Map<String, dynamic> toJSon() {
    Map<String, dynamic> json = new Map<String, dynamic>();
    json["temp"] = this.temp;
    json["feels_like"] = this.feelsLike;
    json["tempMin"] = this.tempMin;
    json["tempMax"] = this.tempMax;
    json["pressure"] = this.pressure;
    json["humidity"] = this.humidity;
    return json;
  }
}
