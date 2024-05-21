import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:projeto_clima_api/Controller/weather_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherController _controller = WeatherController();

  @override
  void initState() {
    super.initState();
    // geolocator
    _getWeather();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Clima-Tempo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/favorites');}, child: Text("Favoritos")),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/search');}, child: Text("Localização"))
                ],
              ),
              SizedBox(height: 20),
              // construir a exibição do clima(geolocation)
              _controller.weatherList.isEmpty
                  ? 
                  Column(
                    children: [
                      Text("Localização não encontrada!"),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () {
                          _getWeather();
                        },
                      )
                    ])
                  : 
                  Column(
                    children: [
                      Text(_controller.weatherList.last.name),
                      Text(_controller.weatherList.last.main),
                      Text(_controller.weatherList.last.description),
                      Text((_controller.weatherList.last.temp-273).toString()),
                      Text((_controller.weatherList.last.tempMax-273).toString()),
                      Text((_controller.weatherList.last.tempMin-273).toString()),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () {
                          _getWeather();
                        },
                      )
                    ],
                  )
            ],
          ),
        ),
      ),
    );
  }
}
