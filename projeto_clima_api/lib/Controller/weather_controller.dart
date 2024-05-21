import 'package:projeto_clima_api/Model/weather_model.dart';
import 'package:projeto_clima_api/Service/weather_service.dart';

class WeatherController {
  final List<Weather> _weatherList = [];

  //get
  List<Weather> get weatherList => _weatherList;

  final WeatherService _service = WeatherService();
  //metodos
  Future<void> getWeather(String city) async {
    try {
      Weather weather = Weather.fromJson(await _service.getWeather(city));
      _weatherList.add(weather);
    } catch (e) {
      print(e);
    }
  }

    Future<void> getWeatherbyLocation(double lat, double lon) async {
    try {
      Weather weather = Weather.fromJson(await _service.getWeatherbyLocation(lat, lon));
      _weatherList.add(weather);
    } catch (e) {
      print(e);
    }
  }
}
