import 'package:weather_app/models/weather_model.dart';

class WeatherState{

}
class WeatherInitialState extends WeatherState{

}
class WeatherFaliurState extends WeatherState{
final String errormessage;

  WeatherFaliurState({required this.errormessage});
}
class WeatherLoadedState extends WeatherState{

}