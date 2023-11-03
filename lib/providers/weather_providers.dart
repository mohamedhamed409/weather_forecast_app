import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather_model.dart';

class WeatherProviders extends ChangeNotifier {
  WeatherModel? _weatherModelData;
  String? cityName;
  set weatherModelData(WeatherModel? weatherModel) {
    
    _weatherModelData = weatherModel;
    notifyListeners();
  }

  WeatherModel? get weatherModelData => _weatherModelData;
}
