import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/weather_providers.dart';
import 'package:provider/provider.dart';

import 'screens/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProviders();
      },
      child: WeatherApp()));
}

// ignore: use_key_in_widget_constructors
class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          appBarTheme: const AppBarTheme(
              elevation: 0.0,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700))),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
