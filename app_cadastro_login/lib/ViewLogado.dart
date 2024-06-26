import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggedInPage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<LoggedInPage> {
  late SharedPreferences _prefs;
  bool _darkMode = false;


  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }


  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = _prefs.getBool('darkMode') ?? false;
    });
  }


  Future<void> _toggleDarkMode() async {
    setState(() {
      _darkMode = !_darkMode;
    });
    await _prefs.setBool('darkMode', _darkMode);
  }


  @override
  Widget build(BuildContext context) {
    _loadPreferences();
    return AnimatedTheme(
      data: _darkMode ? ThemeData.dark() : ThemeData.light(), // Define o tema com base no modo escuro
      duration: Duration(milliseconds: 500), // Define a duração da transição
      child: Scaffold(
        appBar: AppBar(
          title: Text('Armazenamento Interno'),
        ),
        body: Center(
          child: Switch(
            value: _darkMode,
            onChanged: (value) {
              _toggleDarkMode();
            },
          ),
        ),
      ),
    );
  }
}