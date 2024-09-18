import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_finalcode/cubits/weather_cubit.dart/weather_states.dart';
import 'package:weatherapp_finalcode/models/weather_model.dart';
import 'package:weatherapp_finalcode/services/get_weather.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherModel? weatherModel;
  WeatherCubit() : super(WeatherInitialState());
  GetWeather({required String cityName}) async {
    try {
      weatherModel =
          await GetWeatherService().getDayWeather(cityName: cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherfailureState());
    }
  }
}
