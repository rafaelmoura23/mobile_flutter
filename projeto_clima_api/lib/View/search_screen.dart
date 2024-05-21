import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:projeto_clima_api/Controller/weather_controller.dart';
import 'package:projeto_clima_api/Service/weather_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Map<String, dynamic> _weatherData;
  final WeatherController _controller = WeatherController();
  final WeatherService _weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    // _weatherService.getWeather('Rio de Janeiro');
    // _fetchWeatherData('Limeira');
    _getWeatherData("Limeira");
  }

  Future<void> _getWeather() async {
    try {
      Position _position = await Geolocator.getCurrentPosition();
      print(_position.latitude);
      print(_position.longitude);
      _controller.getWeatherbyLocation(_position.latitude, _position.longitude);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  Future<void> _getWeatherData(String city) async {
    try {
      final weatherData = await _weatherService.getWeather(city);
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerWeather = new TextEditingController();
    String temp =
        'Temperature: ${(_weatherData['main']['temp'] - 273.16).toStringAsFixed(2)} °C';
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather Forecast'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
              child: Column(
            children: [
              Container(
                child: _weatherData == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'City: ${_weatherData['name']}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: AutofillHints.sublocality,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 31, 31, 31),
                              ),
                            ),
                            Text(
                              'Country: ${_weatherData['sys']['country']}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 31, 31, 31),
                              ),
                            ),
                            Text(
                              '${temp}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 31, 31, 31),
                              ),
                            ),
                            Text(
                              'Feels Like: ${(_weatherData['main']['feels_like'] - 273.16).toStringAsFixed(2)} °C',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 31, 31, 31),
                              ),
                            ),
                            Text(
                              'Description: ${_weatherData['weather'][0]['description']}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 31, 31, 31),
                              ),
                            ),
                            Text(
                              'Wind Speed: ${_weatherData['wind']['speed']} m/s',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 31, 31, 31),
                              ),
                            ),
                            Text(
                              'Humidity: ${_weatherData['main']['humidity']}%',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 31, 31, 31),
                              ),
                            ),
                            Text(
                              'Pressure: ${_weatherData['main']['pressure']} mb',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 31, 31, 31),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              Column(
                children: [
                  TextFormField(
                    controller: _controllerWeather,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {
                        _getWeatherData(_controllerWeather.text);
                      },
                      child: const Text("Pesquisar"))
                ],
              ),
            ],
          )),
        ));
  }
}
