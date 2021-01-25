import 'package:weather_flutter_app/model/weather_model.dart';
import 'package:weather_flutter_app/network/api_base_helper.dart';

class WeatherRepository {
  final String apiKey = "3270db3293e08915847b36acbea03257";
  ApiBaseHelper _apiHelper = ApiBaseHelper();

  Future<WeatherModel> fetchWeather(String cityName) async {
    final response = await _apiHelper.get("weather?q=$cityName&appid=$apiKey");
    return WeatherModel.fromJson(response["main"]);
  }
}