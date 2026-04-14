 import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:my_basic_projects/WeatherApp/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  const WeatherCard({super.key, required this.weather});

  String formatTime(int timestamp){
    final date= DateTime.fromMicrosecondsSinceEpoch(timestamp* 1000);
    return DateFormat('hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color.fromARGB(113, 255, 255, 255),
            borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                  weather.description.contains('rain')
                      ?'assets/rain.json'
                      :weather.description.contains('clear')
                      ?'assets/sunny.json'
                      :'assets/cloudy.json',
                height: 150,
                width: 150
              ),
              
              Text(weather.city, style: Theme.of(context).textTheme.headlineSmall),

              SizedBox(height: 10),

              Text(
                '${weather.temprature.toStringAsFixed(1)}°C',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              Text(
                weather.description,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.orange,),

                      Text(
                        'Sunrise',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      Text(
                        formatTime(weather.sunrise),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      Text(
                        'Humidity: ${weather.humidity}%',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Icon(
                        Icons.nights_stay_outlined,
                        color: Colors.purple),

                      Text(
                        'Sunset',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      Text(
                        formatTime(weather.sunset),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      Text(
                        'Wind: ${weather.windSpeed} m/s',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
