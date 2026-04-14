import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_basic_projects/WeatherApp/models/weather_model.dart';

class WeatherServices{
  final String apiKey= 'API_KEY';

  Future<WeatherModel> featchWeather(String city) async{
    final url= Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey');

    final response = await http.get(url);

    if(response.statusCode== 200){
      return WeatherModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load weather');
    }
  }
}
