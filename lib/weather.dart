import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacja/weather_model.dart';
import 'package:stacja/weather_provider.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  var _city = "";
  var _description = "";

  @override
  void initState() {
    super.initState();
    WeatherProvider().getWeather("gdynia").then(_onForecastLoaded);
  }

  _onForecastLoaded(WeatherForecast weatherForecast) {
    setState(() {
      _city = weatherForecast?.city?.name ?? "";
      _description = weatherForecast?.list
          ?.elementAt(0)
          ?.weather
          ?.elementAt(0)
          ?.description;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Weather")),
        body: Center(
            child: Container(
                child: Column(
          children: [
            Text(_city, style: TextStyle(color: Colors.amber, fontSize: 24)),
            Text(_description,
                style: TextStyle(color: Colors.red, fontSize: 24)),
          ],
        ))));
  }
}
