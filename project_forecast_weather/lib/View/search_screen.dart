import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project_forecast_weather/Service/service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final WeatherService _weatherService = WeatherService(
    apiKey:
        '681126f28e7d6fa3a7cfe0da0671e599', // Chave de API para acesso à API de previsão do tempo.
    baseUrl:
        'https://api.openweathermap.org/data/2.5', // URL base da API de previsão do tempo.
  );

  late Map<String, dynamic> _weatherData;

  @override
  void initState() {
    super.initState();
    // _weatherService.getWeather('Rio de Janeiro');
    // _fetchWeatherData('Limeira');
    _fetchWeatherGeo();
  }

  Future<void> _fetchWeatherGeo() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final weatherData = await _weatherService.getWeatherbyLocation(
          position.latitude, position.longitude);
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _fetchWeatherData(String city) async {
    try {
      // Obtém os dados de previsão do tempo para a cidade especificada.
      final weatherData = await _weatherService.getWeather(city);
      // Atualiza o estado do widget com os novos dados de previsão do tempo.
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      // Em caso de erro ao buscar os dados de previsão do tempo, exibe uma mensagem de erro no console.
      print('Error fetching weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerWeather = new TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather Forecast'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
              child: Column(
            children: [
              _weatherData == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('City: ${_weatherData['name']}'),
                          Text(
                              'Country: ${_weatherData['sys']['country']}'), // Exibe o nome da cidade.
                          Text(
                              'Temperature: ${(_weatherData['main']['temp'] - 273.16).toStringAsFixed(2)} °C'),
                          Text(
                              'Feels Like: ${(_weatherData['main']['feels_like'] - 273.16).toStringAsFixed(2)} °C'),
                          // Exibe a temperatura em graus Celsius.
                          Text(
                              'Description: ${_weatherData['weather'][0]['description']}'),
                          Text(
                              'Wind Speed: ${_weatherData['wind']['speed']} m/s'),
                          Text(
                              'Humidity: ${_weatherData['main']['humidity']}%'),
                          Text(
                              'Pressure: ${_weatherData['main']['pressure']} mb'),
                        ],
                      ),
                    ),
              Column(
                children: [
                  TextFormField(
                    controller: _controllerWeather,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _fetchWeatherData(_controllerWeather.text);
                      },
                      child: const Text("Pesquisar"))
                ],
              ),
            ],
          )),
        ));
  }
}
