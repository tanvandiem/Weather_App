import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherForecast {
  final String date;
  final double temperature;
  final double humidity;
  final double wind;
  final double pressure;
  final double cloudiness;
  final WeatherCondition weatherCondition;

  WeatherForecast({
    required this.date,
    required this.temperature,
    required this.humidity,
    required this.wind,
    required this.pressure,
    required this.cloudiness,
    required this.weatherCondition,
  });

  @override
  String toString() {
    return 'Forecast(date: $date, temperature: ${temperature.toStringAsFixed(2)}, humidity: $humidity, wind: ${wind.toStringAsFixed(2)}, pressure: $pressure, cloudiness: $cloudiness%)';
  }
}

Widget getWeatherIcon1(WeatherCondition condition, double size) {
  return SizedBox(
    width: size,
    height: size,
    child: Lottie.asset(
      _getLottieAnimationPath(condition),
      width: size,
      height: size,
      fit: BoxFit.contain,
    ),
  );
}

String _getLottieAnimationPath(WeatherCondition condition) {
  switch (condition) {
    case WeatherCondition.sun:
      return 'assets/sun.json'; // Đường dẫn đến tệp hoạt ảnh Lottie cho trạng thái nắng.
    case WeatherCondition.cloud:
      return 'assets/cloud.json'; // Đường dẫn đến tệp hoạt ảnh Lottie cho trạng thái mây.
    case WeatherCondition.rain:
      return 'assets/rain2.json'; // Đường dẫn đến tệp hoạt ảnh Lottie cho trạng thái mưa.
    case WeatherCondition.partiallyCloudy:
      return 'assets/partially_cloudy.json'; // Đường dẫn đến tệp hoạt ảnh Lottie cho trạng thái mây phần.
    case WeatherCondition.snow:
      return 'assets/snow.json'; // Đường dẫn đến tệp hoạt ảnh Lottie cho trạng thái tuyết.
  }
}


enum WeatherCondition {
  sun,
  cloud,
  rain,
  partiallyCloudy,
  snow,
}