import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/di/app_module.dart';
import 'package:weather_app/weather_app.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appModule = AppModule();
  appModule.initDependencies();
  MobileAds.instance.initialize();

  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: "basic_group",
        channelKey: "basic",
        channelName: "Weather app",
        channelDescription: "Weather app notification",
      ),
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: "basic_group",
        channelGroupName: "basic group",
      ),
    ],
  );

  bool isAllowedToSendNotification = await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  runApp(
    WeatherApp(
      appModule: appModule,
    ),
  );
}
