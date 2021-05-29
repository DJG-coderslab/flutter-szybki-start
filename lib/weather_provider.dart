import 'dart:convert';

import 'package:http/http.dart';
import 'package:stacja/weather_model.dart';

class WeatherProvider {

  final _endpoint = "https://api.openweathermap.org/data/2.5/forecast/daily?cnt=7&units=metric&APPID=b933866e6489f58987b2898c89f542b8&q=";
 
  Future<WeatherForecast> getWeather(String city) async {
     final response = await get(Uri.parse("$_endpoint$city"));
     if (response.statusCode >= 200 && response.statusCode < 300) {
       var data = json.decode(response.body);
       return WeatherForecast.fromJson(data);
     } else {
       throw Exception("Error getting weather: ${response.reasonPhrase}");
     }
  }
  
}