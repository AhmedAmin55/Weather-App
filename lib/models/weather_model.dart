class WeatherModel {
  String cityName;
  DateTime updateTime;
  String? Image;
  double avrTemp;
  double maxTemp;
  double minTemp;
  String dayWeather;

  WeatherModel({
    required this.cityName,
    required this.updateTime,
    required this.Image,
    required this.avrTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.dayWeather,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      updateTime: DateTime.parse(json["current"]["last_updated"]),
      Image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      avrTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      dayWeather: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
    );
  }
}
