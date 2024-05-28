import 'package:flutter/material.dart';
import 'package:projeto_clima_api/Controller/weather_controller.dart';

class WeatherDetailsScreen extends StatefulWidget {
  final String cityName;
  const WeatherDetailsScreen({super.key, required this.cityName});

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  final WeatherController _controller = WeatherController();

  @override
  void initState() {
    _controller.getWeather(widget.cityName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cityName),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Weather Details',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder(
                future: _controller.getWeather(widget.cityName),
                builder: (context, snapshot) {
                  if (_controller.weatherList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_controller.weatherList.last.name),
                            IconButton(
                              icon: const Icon(Icons.favorite_border_outlined),
                              onPressed: (){
                                  // favorites
                              },
                              )
                          ],
                        ),
                        Text(_controller.weatherList.last.description),
                        Text((_controller.weatherList.last.temp - 273).toStringAsFixed(2)),
                        Text((_controller.weatherList.last.tempMax - 273).toStringAsFixed(2)),
                        Text((_controller.weatherList.last.tempMin - 273).toStringAsFixed(2)),
                        Text(_controller.weatherList.last.main),
                      ],
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
