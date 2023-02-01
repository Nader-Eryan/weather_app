// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherModel {
  String cityName;
  String date;
  double minTemp;
  double maxTemp;
  double avgTemp;
  String imgUrl;
  String condition;
  WeatherModel({
    required this.cityName,
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.avgTemp,
    required this.imgUrl,
    required this.condition,
  });
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0];

    return WeatherModel(
        cityName: data['location']['name'],
        date: data['current']['last_updated'],
        minTemp: jsonData['day']['mintemp_c'],
        maxTemp: jsonData['day']['maxtemp_c'],
        avgTemp: jsonData['day']['avgtemp_c'],
        imgUrl: jsonData['day']['condition']['icon'],
        condition: jsonData['day']['condition']['text']);
  }
  @override
  String toString() {
    return 'avgtemp= $avgTemp ,minTemp= $minTemp, date= $date';
  }
}
