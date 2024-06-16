import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/network/weather_forecast.dart';

class WeatherForecastDayCard extends StatelessWidget {
  const WeatherForecastDayCard({
    super.key,
    required this.forecast,
  });

  final WeatherForecast forecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),

      // child: Container(
      //   margin: EdgeInsets.only(
      //     top: 10.0,
      //   ),
      //   decoration: BoxDecoration(
      //     color: Colors.lightBlue,
      //     borderRadius: BorderRadius.circular(18),
      //   ),
      //   child: Card(
      //     child: Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      //       child: Row(
      //         mainAxisSize: MainAxisSize.max,
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             DateFormat('E').format(DateTime.parse(forecast.date)),
      //             style: TextStyle(fontSize: 12.sp),
      //           ),
      //           //  getWeatherIcon(forecast.weatherCondition, 30)
      //           getWeatherIcon1(forecast.weatherCondition, 30),
      //           Text(
      //             '${forecast.temperature.toStringAsFixed(1)} °C',
      //             style: TextStyle(fontSize: 12.sp),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: 100,
              margin: const EdgeInsets.only(
                top: 10.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.lightBlueAccent,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 5,
                //     blurRadius: 7,
                //     offset: Offset(0, 3), // changes position of shadow
                //   ),
                // ],
              ),
              child: Container(
                margin: const EdgeInsets.only(right: 10, top:10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
             
                height: 120,
                child: getWeatherIcon1(forecast.weatherCondition, 100),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 80,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          DateFormat('E').format(DateTime.parse(forecast.date)),
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 1,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(22),
                            bottomLeft: Radius.circular(22),
                          ),
                        ),
                        child: Text(
                          '${forecast.temperature.toStringAsFixed(1)} °C',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      
    );
  }
}
