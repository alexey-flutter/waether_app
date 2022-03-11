import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/widgets/forecast_card.dart';

class BottomListView extends StatelessWidget {
  const BottomListView({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('7-Day Weather Forecast'.toUpperCase(),
            style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold)),
        Container(
          height: 180,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Container(
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    color: Colors.blueGrey,
                    child: forecastCard(snapshot, index),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    width: 8,
                  ),
              itemCount: snapshot.data!.list.length),
        ),
      ],
    );
  }
}
