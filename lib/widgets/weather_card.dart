import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/modules/weather_module.dart';
import 'package:lottie/lottie.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.weather});
  final Weather weather;
  String formatTime(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat("hh:mm a").format(date);
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color.fromARGB(113, 255, 255, 255)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset(
                weather.description.contains('rain')
                    ?'assets/rain.json'
                    :weather.description.contains('clear')
                    ?'assets/sunny.json'
                    :'assets/cloudy.json',
                    height:150,
                    width: 150


              ),
              Text(
                  weather.cityName,
                style: Theme.of(context).textTheme.headlineSmall

              ),

              SizedBox(
                height: 11,
              ),

              Text(
                '${weather.temperature.toStringAsFixed(1)}°C',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),

              ),

              SizedBox(
                height: 11,
              ),
              Text(
                weather.description,
                style:Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 11,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Humidity: ${weather.humidity}%',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'wind: ${weather.windSpeed}%',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              SizedBox(
                height: 11,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column( // for sunrise
                    children: [
                      Icon(Icons.wb_sunny_outlined,
                        color: Colors.orange,),
                      Text(
                        'Sunrise:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        formatTime(weather.sunRise),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                    ],
                  ),


                  Column( //for sunset
                    children: [
                      Icon(Icons.nights_stay_outlined,
                        color: Colors.purple,
                      ),
                      Text(
                        'Sunset:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        formatTime(weather.sunSet),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                    ],
                  ),
                ],
              ),



            ],
          ),

        )
      ],
    );
  }
}

