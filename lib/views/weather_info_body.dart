import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});
  @override
  Widget build(BuildContext context) {
    WeatherModel weathermodel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
       decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [getThemeColor(weathermodel.statues),
              getThemeColor(weathermodel.statues)[300]!,
               getThemeColor(weathermodel.statues)[50]!
              ], 
            ),
          ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
             weathermodel.cityName,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
            'Update at ${ weathermodel.lastUpdete.hour}:${weathermodel.lastUpdete.minute}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.network('https:${weathermodel.image}'),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    weathermodel.avarageTemp.toString(),
                    style: TextStyle(fontSize: 32),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      Text(
                        'MaxTemp :${weathermodel.maxTemp.round()}',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                       'MinTemp :${ weathermodel.minTemp.round()}',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                weathermodel.statues,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
