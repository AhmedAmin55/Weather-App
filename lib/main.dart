import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_finalcode/cubits/weather_cubit.dart/weather_cubit.dart';
import 'package:weatherapp_finalcode/cubits/weather_cubit.dart/weather_states.dart';
import 'package:weatherapp_finalcode/view/home_page.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<WeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: changeColor(
                      weatherCondition: BlocProvider.of<WeatherCubit>(context)
                          .weatherModel
                          ?.dayWeather)),
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor changeColor({required String? weatherCondition}) {
  log(weatherCondition.toString());
  if (weatherCondition == null) return Colors.blue;
  switch (weatherCondition) {
    // Clear/Partly Clear Weather
    case "Sunny":
      return Colors.amber;
    // Cloudy Conditions
    case "Partly cloudy":
    case "Cloudy":
    case "Overcast":
      return Colors.grey;
    // Fog and Mist
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.blueGrey;
    // Rain and Drizzle
    case "Patchy rain possible":
    case "Patchy light drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.lightBlue;

    // Snow and Blizzard
    case "Patchy snow possible":
    case "Blowing snow":
    case "Blizzard":
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.lightBlue;

    // Sleet and Freezing Conditions
    case "Patchy sleet possible":
    case "Patchy freezing drizzle possible":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.cyan;

    // Thunderstorms
    case "Thundery outbreaks possible":
      return Colors.deepPurple;

    // Ice Pellets and Hail
    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.cyan;

    // Default case for undefined weather conditions
    default:
      return Colors.blue;
  }
}
