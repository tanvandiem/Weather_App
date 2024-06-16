

class AppUrls {
  String get baseUrl => 'https://api.openweathermap.org/data/2.5/forecast';

  String weatherForecast(double lon, double lat) =>
      '$baseUrl/?appid=2992bd40d761d27da08e01a381e32378&lat=$lat&lon=$lon&exclude=hourly,daily&units=metric';
}