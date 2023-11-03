import 'dart:convert';

import 'package:flutter_application_1/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'bbc0f1716c814efe9f5103410232907';
  WeatherModel? weather;

  Future<WeatherModel?> getData({required String cityName}) async {
    try {
      Uri url = Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=no&alerts=no');
      http.Response response = await get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
      return weather;
    } catch (ex) {
      print(ex);
    }
  }
}
