import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather_model.dart';
import 'package:flutter_application_1/providers/weather_providers.dart';
import 'package:flutter_application_1/services/get_api.dart';
import 'package:provider/provider.dart';

// WeatherServices? weatherServices;
// WeatherModel? weatherModel;
// WeatherProviders? weatherProviders;

class Search extends StatelessWidget {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              await onSubmittedOrPressed(context, data);
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {
                  onSubmittedOrPressed(context);
                },
              ),
              contentPadding: const EdgeInsets.all(24),
              labelText: 'Search A City',
              hintText: 'Enter City Name',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onSubmittedOrPressed(BuildContext context,
      [String? data]) async {
    cityName = data;
    WeatherServices weatherServices = WeatherServices();
    WeatherModel? weatherModel;
    await weatherServices.getData(cityName: cityName!).then((value) {
      weatherModel = value;
    }).catchError((onError) {
      debugPrint(onError);
    });
    if (!context.mounted) return;

    Provider.of<WeatherProviders>(context, listen: false).weatherModelData =
        weatherModel;
    Provider.of<WeatherProviders>(context, listen: false).cityName = cityName;

    Navigator.pop(context);
  }
}
