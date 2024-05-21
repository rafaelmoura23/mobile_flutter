import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // geolocator
  }

  Future<void> updateWeatherbyLocation() async {}

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
