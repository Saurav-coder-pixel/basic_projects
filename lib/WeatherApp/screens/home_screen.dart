import 'package:flutter/material.dart';
import 'package:my_basic_projects/WeatherApp/models/weather_model.dart';
import 'package:my_basic_projects/WeatherApp/services/weather_services.dart';
import 'package:my_basic_projects/WeatherApp/widget/weather_card.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final TextEditingController _controller= TextEditingController();

  //Instance to call api
  final WeatherServices _weatherServices= WeatherServices();
  bool _isLoading= false;
  WeatherModel? _weather;

  void _getWeather() async{
    setState(() {
      _isLoading= true;
    });

    try{
      final weather= await _weatherServices.featchWeather(_controller.text);
      setState(() {
        _weather= weather;
        _isLoading= false;
      });
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Error')
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: _weather != null && _weather!.description.toLowerCase().contains('rain')
              ? const LinearGradient(
            colors: [Colors.grey, Colors.blueGrey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
              : _weather != null && _weather!.description.toLowerCase().contains('clear')
              ? const LinearGradient(
            colors: [Colors.orangeAccent, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
              :const LinearGradient(
            colors: [Colors.blue, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),

        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 25),

                Text('Weather App',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                ),
                SizedBox(height: 25),

                TextField(
                  controller: _controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter City Name",
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Color.fromARGB(110, 255, 255, 255),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    )
                  ),
                ),
                
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: _getWeather,
                    child: Text('Get Weather', style: TextStyle(fontSize: 18),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                  ),
                ),
                if(_isLoading)
                  Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator(color: Colors.white,),),

                if(_weather != null)
                  WeatherCard(weather: _weather!),
              ],
            ),
          ),
        ),
      )
    );
  }
}
