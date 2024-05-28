import 'package:flutter/material.dart';
import 'package:projeto_clima_api/Controller/weather_controller.dart';
import 'package:projeto_clima_api/View/details_weather_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cityController = TextEditingController();
  final WeatherController _controller = WeatherController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _cityController,
                    decoration:
                        const InputDecoration(hintText: "Enter the city name"),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Please enter a city";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _cityFind(_cityController.text);
                        }
                      },
                      child: Text("Search"))
                ],
              )),
        ),
      ),
    );
  }

Future<void> _cityFind(String city) async {
    if (await _controller.findCity(city)) {
      //snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("City found"),
          duration: Duration(seconds: 1),
        ),
      );
      //navigation to details
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WeatherDetailsScreen(cityName: city)));
    }else{
      // snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("City not found"),
          duration: Duration(seconds: 2),
        ),
      );
      _cityController.clear();
    }
  }
}

