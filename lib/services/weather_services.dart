import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/modules/weather_module.dart';

class WeatherServices{
  final String apikey="PASTE_YOUR_API_KEY";
  Future<Weather> fetchWeather(String cityName) async{
    //Get coordinates of city

    final geoUrl = Uri.parse("https://api.openweathermap.org/geo/1.0/direct?q=$cityName&limit=1&appid=$apikey");
    final geoResponse = await http.get(geoUrl);

    if (geoResponse.statusCode != 200 || jsonDecode(geoResponse.body).isEmpty) {
      throw Exception("Failed to fetch location coordinates");
    }

    final geoData = jsonDecode(geoResponse.body)[0];
    final double lat = geoData['lat'];
    final double lon = geoData['lon'];

    // Step 2: Get weather using lat/lon from OneCall API
    final weatherUrl = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$apikey"
    );
    final weatherResponse = await http.get(weatherUrl);

    if (weatherResponse.statusCode == 200) {
      final jsonMap = jsonDecode(weatherResponse.body);
      return Weather.fromJson(jsonMap);
    } else {
      throw Exception("Failed to fetch weather data");
    }
  }

}