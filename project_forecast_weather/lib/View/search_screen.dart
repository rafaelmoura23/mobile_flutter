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
        '9a180e5bbd3fbe3fd2b5cd74cb5bfc6f', // Chave de API para acesso à API de previsão do tempo.
    baseUrl:
        'https://api.openweathermap.org/data/2.5', // URL base da API de previsão do tempo.
  );

  late Map<String, dynamic> _weatherData;

  @override
  void initState() {
    super.initState();
    // _weatherService.getWeather('Rio de Janeiro');
    _fetchWeatherData('Limeira');
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
    String temp = 'Temperature: ${(_weatherData['main']['temp'] - 273.16).toStringAsFixed(2)} °C';
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
                            (_weatherData['main']['temp'] - 273.16) < 15
                                ? Image.asset('assets/img/Weather-cold.png',
                                    width: 300, height: 300)
                                : (_weatherData['main']['temp'] - 273.16) < 25
                                    ? Image.asset('assets/img/Weather-wind.png',
                                        width: 300, height: 300)
                                    : Image.asset('assets/img/Weather-hot.png',
                                        width: 300, height: 300),
                            
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
