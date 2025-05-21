
import 'dart:convert';
import 'package:flutter_weather_app_bloc/data/model/weather_model.dart';
import 'package:flutter_weather_app_bloc/utils/constants.dart';
import 'package:http/http.dart';
class ApiService {
  Future<WeatherModel> getWeatherData(String searchText) async {
    String url = "$base_url&q=$searchText&days=7";

    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        WeatherModel weatherModel = WeatherModel.fromJson(json);
        return weatherModel;
      } else {
        throw ("No data found");
      }
    } catch (e) {
      throw e.toString();
    }
  }
}