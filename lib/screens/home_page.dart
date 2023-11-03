import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather_model.dart';
import 'package:flutter_application_1/providers/weather_providers.dart';
import 'package:provider/provider.dart';

import '../moudles/no_weather.dart';
import '../moudles/weather_exist.dart';
import 'search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    weatherModel = Provider.of<WeatherProviders>(context).weatherModelData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 10),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Search();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: weatherModel == null
          ?const  NoWeather()
          : WeatherExist(weatherModel: weatherModel),
    );
  }
}
