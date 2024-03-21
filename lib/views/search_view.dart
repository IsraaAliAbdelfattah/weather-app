import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/servieces/weather_services.dart';
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: TextField(
            onSubmitted: (value)async{
            var getweathercubit =  BlocProvider.of<GetWeatherCubit>(context);
            getweathercubit.getWeather(cityName: value);
            Navigator.pop(context);
            },
            decoration: InputDecoration(
              //contentPadding: , padding inside the text field
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Enter City Name',
            ),
          ),
        ),
      ),
    );
  }
}
