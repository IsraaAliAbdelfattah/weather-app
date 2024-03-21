import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/servieces/weather_services.dart';
import 'package:weather_app/views/search_view.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit():super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
   weatherModel =
      await WeatherService(Dio()).getcurrentweather(cityName: cityName);
      emit(WeatherLoadedState());
} catch (e) {
  // TODO
  emit(WeatherFaliurState(
    errormessage:e.toString()
    )
    );
}
        
  }
}
