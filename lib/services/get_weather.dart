import 'dart:async';

import 'package:dio/dio.dart';
import 'package:weatherapp_finalcode/models/weather_model.dart';

class GetWeatherService {
  Future<WeatherModel> getDayWeather({required String cityName}) async {
    String baseUrl = "https://api.weatherapi.com/v1";
    String apiKey = "0d344f3357954a0c82665820241808";
    String url = "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1";
    try {
      Dio dio = Dio();
      Response response = await dio.get(url);
      var jsonDate = response.data;
      WeatherModel weatherModel = WeatherModel.fromJson(jsonDate);
      print(weatherModel);
      return weatherModel;
    } on DioException catch (e) {
      String errorMessage = e.response?.data['error']['message'] ?? "Try later";
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
