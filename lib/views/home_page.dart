import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit_states.dart';
import 'package:weather_app/views/no_weather_body.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/views/weather_info_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon:const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit,WeatherState>(builder: (context,state)
      {
       if(state is WeatherInitialState){
        return const NoWeatherBody();
       }
       else if(state is WeatherLoadedState){
        return WeatherInfoBody();
       }
       else{
        return const Center(child: Text('There was an error'));
       }
      },
      ),
    );
  }
}
//create states
// create cubit
// create function
// provide cubit
// integrate cubit
// trigger cubit