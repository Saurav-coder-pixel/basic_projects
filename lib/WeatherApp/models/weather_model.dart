class WeatherModel{
  final String city;
  final double temprature;
  final String description;
  final int humidity;
  final double windSpeed;
  final int sunrise;
  final int sunset;

  WeatherModel(
  {
    required this.city,
    required this.description,
    required this.temprature,
    required this.humidity,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,});

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    return WeatherModel(
        city: json['name'],
        description: json['weather'][0]['description'],
        temprature: (json['main']['temp'] as num).toDouble() - 273.15,
        humidity: json['main']['humidity'],
        windSpeed: (json['wind']['speed'] as num).toDouble(),
        sunrise: json['sys']['sunrise'],
        sunset: json['sys']['sunset']
    );
  }
}