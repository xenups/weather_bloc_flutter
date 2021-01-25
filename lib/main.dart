import 'package:flutter/material.dart';
import 'package:weather_flutter_app/view/weather_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Bloc',
      home: WeatherHome(),
    );
  }
}
