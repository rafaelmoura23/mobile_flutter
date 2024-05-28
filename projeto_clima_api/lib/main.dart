import 'package:flutter/material.dart';
import 'package:projeto_clima_api/View/details_weather_screen.dart';
import 'package:projeto_clima_api/View/favorites_screen.dart';
import 'package:projeto_clima_api/View/search_screen.dart';
import 'View/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto API GEO',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context) => const HomeScreen(),
        '/favorites':(context) => const FavoritesScreen(),
        '/search':(context) => const SearchScreen()
      },
    );
  }
}
