import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utilities/forecast_util.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var pressure = forecastList![0].pressure * 0.750062;
    var humidity = forecastList[0].humidity;
    var wind = forecastList[0].speed;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Util.getItem(Icons.thermostat_rounded, pressure.round(), 'mm Hg'),
          Util.getItem(Icons.cloud_outlined, humidity, '%'),
          Util.getItem(Icons.air, wind.toInt(), 'm/s')
        ],
      ),
    );
  }
}
