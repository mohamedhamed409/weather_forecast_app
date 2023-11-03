import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/weather_model.dart';
import '../providers/weather_providers.dart';

class WeatherExist extends StatelessWidget {
  const WeatherExist({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      
        width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
    getBackgroundColor(weatherModel!.tempState)[900]!,
    getBackgroundColor(
        weatherModel!.tempState),
    getBackgroundColor(
            weatherModel!.tempState)
        .shade200,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Text(
              Provider.of<WeatherProviders>(context).cityName!,
              style: const TextStyle(
                fontSize: 56,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              weatherModel!.dateTime,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Image(
                      image: AssetImage(
                        weatherModel!.getImage(),
                      ),
                    ),
                  ),
                ),
                Text(
                  weatherModel!.avgTemp.toString(),
                  style: const TextStyle(
                    fontSize: 42,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                        'max temp : ${weatherModel!.maxTemp.toString()}'),
                    Text(
                        'min temp : ${weatherModel!.minTemp.toString()}'),
                  ],
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              weatherModel!.tempState,
              style: const TextStyle(
                fontSize: 42,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      );
  }
}


MaterialColor getBackgroundColor(String tempState) {
  if (tempState == 'Clear' || tempState == 'Light Cloud') {
    return Colors.indigo;
  } else if (tempState == 'Sleet' ||
      tempState == 'Snow' ||
      tempState == 'Hail') {
    return Colors.blue;
  } else if (tempState == 'Heavy Cloud') {
    return Colors.deepPurple;
  } else if (tempState == 'Light Rain' ||
      tempState == 'Heavy Rain' ||
      tempState == 'Patchy rain possible' ||
      tempState == 'Showers') {
    return Colors.lightBlue;
  } else if (tempState == 'Thunderstorm' || tempState == 'Thunder') {
    return Colors.lime;
  } else {
    return Colors.cyan;
  }
}

