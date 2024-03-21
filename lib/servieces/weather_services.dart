import 'dart:developer';
import 'package:weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);
  final String baseurl = 'http://api.weatherapi.com/v1';
  final String Apikey = '9440ea458b01477ab3f171832240402';
  Future<WeatherModel> getcurrentweather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseurl/forecast.json?key=$Apikey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      // TODO
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try later!';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later!');
    }
  }
}
