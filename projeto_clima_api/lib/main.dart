import 'package:flutter/material.dart';
import 'View/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Projeto API GEO',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/home':(context) => const HomeScreen(),
      //   '/favorites':(context) => const FavoritesScreen(),
      //   '/search':(context) => const SearchScreen()
      // },

    );
  }
}
