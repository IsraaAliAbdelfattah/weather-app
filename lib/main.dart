import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit_states.dart';
import 'package:weather_app/views/home_page.dart';
import 'package:weather_app/cubits/get weather cubit/get_weather_cubit.dart';

void main() {
  runApp(const Weather());
}

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.statues),
              ),
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            );
          },
        ),
      ),
    );
  }

 
}
 MaterialColor getThemeColor(String? condition) {
    if (condition == null) {
      return Colors.blue;
    }
    switch (condition.toLowerCase()) {
      case 'sunny':
        return Colors.orange;
        break;
      case 'partly cloudy':
        return Colors.blue;
        break;
      case 'cloudy':
      case 'overcast':
        return Colors.grey;
        break;
      case 'mist':
      case 'patchy rain possible':
      case 'patchy snow possible':
      case 'patchy sleet possible':
      case 'patchy freezing drizzle possible':
      case 'blowing snow':
      case 'blizzard':
      case 'patchy light drizzle':
      case 'light drizzle':
      case 'freezing drizzle':
      case 'heavy freezing drizzle':
        return Colors.lightBlue;
        break;
      case 'thundery outbreaks possible':
        return Colors.amber;
        break;
      case 'fog':
      case 'freezing fog':
        return Colors.grey;
        break;
      case 'patchy light rain':
      case 'light rain':
      case 'moderate rain at times':
      case 'moderate rain':
      case 'heavy rain at times':
      case 'heavy rain':
      case 'light freezing rain':
      case 'moderate or heavy freezing rain':
      case 'light sleet':
      case 'moderate or heavy sleet':
        return Colors.blue;
        break;
      case 'patchy light snow':
      case 'light snow':
      case 'patchy moderate snow':
      case 'moderate snow':
      case 'patchy heavy snow':
      case 'heavy snow':
        return Colors.grey;
        break;
      case 'ice pellets':
        return Colors.blueGrey;
        break;
      case 'light rain shower':
      case 'moderate or heavy rain shower':
      case 'torrential rain shower':
      case 'light sleet showers':
      case 'moderate or heavy sleet showers':
      case 'light snow showers':
      case 'moderate or heavy snow showers':
      case 'light showers of ice pellets':
      case 'moderate or heavy showers of ice pellets':
        return Colors.blue;
        break;
      case 'patchy light rain with thunder':
      case 'moderate or heavy rain with thunder':
      case 'patchy light snow with thunder':
      case 'moderate or heavy snow with thunder':
        return Colors.amber;
        break;
      default:
        return Colors.blue;
    }
  }