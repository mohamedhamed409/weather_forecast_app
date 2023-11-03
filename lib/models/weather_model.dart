class WeatherModel {
  final String dateTime;
  final double minTemp;
  final double avgTemp;
  final double maxTemp;
  final String tempState;

  WeatherModel({
    required this.dateTime,
    required this.minTemp,
    required this.avgTemp,
    required this.maxTemp,
    required this.tempState,
  });
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      minTemp: jsonData['mintemp_c'],
      avgTemp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      dateTime: data['current']['last_updated'],
      tempState: jsonData['condition']['text'],
    );
  }
  @override
  String toString() {
    return 'min temp is $minTemp\n avg temp is $avgTemp\n max temp is $maxTemp';
  }

  String getImage() {
    if (tempState == 'Clear' || tempState == 'Light cloud') {
      return 'assets/images/clear.png';
    } else if (tempState == 'Sleet' ||
        tempState == 'Snow' ||
        tempState == 'Hail') {
      return 'assets/images/snow.png';
    } else if (tempState == 'Heavy Cloud'||tempState=='Overcast') {
      return 'assets/images/cloudy.png';
    } else if (tempState == 'Light Rain' ||
        tempState == 'Heavy rain' ||
        tempState == 'Patchy rain possible' ||tempState=='Light rain'||
        tempState == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (tempState == 'Thunderstorm' || tempState == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }



}
