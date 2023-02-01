import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  static String baseUri = 'http://api.weatherapi.com/v1';
  static String apiKey = 'eaf8db7fbd914e788bb102045220212';
  static Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse('$baseUri/forecast.json?key=$apiKey&q=$cityName');
    http.Response response = await http.get(url);
    dynamic data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    //print(data);
    return weather;
  }
}
