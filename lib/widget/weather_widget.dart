import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherDisplay extends StatefulWidget {
  final String apiKey;
  final String cityName;

  const WeatherDisplay({Key? key, required this.apiKey, required this.cityName})
      : super(key: key);

  @override
  _WeatherDisplayState createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  double? temperature;
  double? humidity;

  Future<void> getWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${widget.cityName}&appid=${widget.apiKey}'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        temperature = (data['main']['temp'] - 273.15); // Convert to Celsius
        humidity = data['main']['humidity'].toDouble();
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Temperature: ${temperature?.toStringAsFixed(2) ?? 'Loading...'}°C',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        Text(
          'Humidity: ${humidity?.toStringAsFixed(2) ?? 'Loading...hoya'}%',
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
