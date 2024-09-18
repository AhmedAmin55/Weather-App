import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_finalcode/cubits/weather_cubit.dart/weather_cubit.dart';
import 'package:weatherapp_finalcode/cubits/weather_cubit.dart/weather_states.dart';
import 'package:weatherapp_finalcode/widgets/info_weather.dart';
import 'package:weatherapp_finalcode/widgets/no_weather_page.dart';
import 'package:weatherapp_finalcode/widgets/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherPage();
          } else if (state is WeatherLoadedState) {
            return InfoWeather();
          } else {
            return Text("there is an error");
          }
        },
      ),
    );
  }
}
