import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_finalcode/cubits/weather_cubit.dart/weather_cubit.dart';
import 'package:weatherapp_finalcode/models/weather_model.dart';
import 'package:weatherapp_finalcode/services/get_weather.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          onSubmitted: (value) async {
            var getWeatherCubit = BlocProvider.of<WeatherCubit>(context);
            getWeatherCubit.GetWeather(cityName: value);
            Navigator.pop(context);
          },
          scrollPadding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.search_outlined),
            labelText: "Search Here",
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            hintText: "Name City",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.orange),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.orange),
            ),
          ),
        ),
      ),
    );
  }
}
