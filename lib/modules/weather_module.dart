class Weather {
  final String cityName;
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;
  final int sunRise;
  final int sunSet;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.sunRise,
    required this.sunSet,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json["name"],
      temperature: json["main"]["temp"], // already in Celsius if &units=metric
      description: json["weather"][0]["description"], // corrected
      humidity: json["main"]["humidity"],
      windSpeed: (json["wind"]["speed"] as num).toDouble(),
      sunRise: json["sys"]["sunrise"],
      sunSet: json["sys"]["sunset"], // corrected
    );
  }
}
