import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather_info.dart';
import 'package:weather_app/services/weather_service.dart';
import '../models/weather_model.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  String? city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('search a city name'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: ((value) {
                city = value;
              }),
              decoration: InputDecoration(
                  label: const Text('search'),
                  hintText: 'Enter a city here',
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: 25,
                      color: Color.fromARGB(255, 18, 115, 21),
                    ),
                    onPressed: () {
                      getWeather(city, context);
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40))),
            ),
          ),
        ));
  }

  getWeather(value, BuildContext context) async {
    city = value;
    WeatherModel? weatherModel;
    if (city != null) {
      try {
        weatherModel = await WeatherService.getWeather(cityName: city!);
      } catch (e) {
        //print('error');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'Please enter a valid city name!',
            style: TextStyle(color: Colors.red, fontSize: 18),
          )),
        );
        return;
      }

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WeatherInfo(
                    weatherModel: weatherModel,
                  )));
    }
  }
}
