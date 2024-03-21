class WeatherModel {
  final String cityName;
  final DateTime lastUpdete;
  final String statues;
  final String image;
  final double maxTemp;
  final double minTemp;
  final double avarageTemp;
  const WeatherModel(
      {required this.cityName,
      required this.lastUpdete,
      required this.statues,
      required this.image,
      required this.maxTemp,
      required this.minTemp,
      required this.avarageTemp});
  factory WeatherModel.fromjson(json){
    return WeatherModel(
        image:json['forecast']['forecastday'][0]['day']['condition']['icon'],
        cityName: json['location']['name'],
        lastUpdete: DateTime.parse(json['current']['last_updated']),
        statues: json['forecast']['forecastday'][0]['day']['condition']['text'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        avarageTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
    );
  }
}
