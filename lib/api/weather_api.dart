import 'package:weather_app/models/weather_forecast_daily.dart';

import 'dart:developer';
import 'dart:convert';

import 'package:weather_app/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast({String? cityName}) async {
    var queryParameters = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName,
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, queryParameters);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error2');
    }
  }
}
