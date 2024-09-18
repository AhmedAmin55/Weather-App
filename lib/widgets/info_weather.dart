import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_finalcode/cubits/weather_cubit.dart/weather_cubit.dart';
import 'package:weatherapp_finalcode/widgets/search_page.dart';

class InfoWeather extends StatelessWidget {
  InfoWeather({super.key});
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Weather App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.blue[200]!,
              Colors.blue[50]!,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              " Updated at ${weatherModel.updateTime.hour}:${weatherModel.updateTime.minute}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  image: NetworkImage("https:${weatherModel.Image!}"),
                ),
                Text(weatherModel.avrTemp.round().toString()),
                Column(
                  children: [
                    Text(
                      "Maxtemp : ${weatherModel.maxTemp.round()}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Mintemp : ${weatherModel.minTemp.round()}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              weatherModel.dayWeather,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
