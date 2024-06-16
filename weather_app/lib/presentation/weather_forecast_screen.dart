import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:weather_app/blocs/weather_forecast_bloc.dart';
import 'package:weather_app/blocs/weather_forecast_state.dart';
import 'package:weather_app/presentation/widgets/weather_forecast_widget.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  InterstitialAd? interstitialAd;
  bool isAdLoaded = false;
  final String interstitialAdUnitId = Platform.isAndroid
      ? 'ca-app-pub-4704157650909741~6191677011' // Thay bằng ID đơn vị quảng cáo thực tế cho Android
      : 'ca-app-pub-4704157650909741/0987654321'; // Thay bằng ID đơn vị quảng cáo thực tế cho iOS

  @override
  void initState() {
    super.initState();
    MobileAds.instance.initialize();
    _loadInterstitialAd();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdFailedToLoad: (LoadAdError error) {
          print("Failed to load interstitial ad: $error");
          setState(() {
            isAdLoaded = false;
          });
        },
        onAdLoaded: (InterstitialAd ad) {
          print('Interstitial ad loaded: $ad');
          setState(() {
            interstitialAd = ad;
            isAdLoaded = true;
          });
          _setFullScreenContentCallback(ad);
        },
      ),
    );
  }

  void _setFullScreenContentCallback(InterstitialAd ad) {
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('$ad onAdShowedFullScreenContent'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent');
        ad.dispose();
        setState(() {
          isAdLoaded = false;
        });
        _loadInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        setState(() {
          isAdLoaded = false;
        });
        _loadInterstitialAd();
      },
      onAdImpression: (InterstitialAd ad) => print("$ad Impression occurred"),
    );
  }

  void _showInterstitialAd() {
    if (isAdLoaded && interstitialAd != null) {
      interstitialAd!.show();
      interstitialAd = null; // Quảng cáo đã được hiển thị, không cần lưu giữ nữa
    } else {
      print("Ad is not ready yet");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ad is not ready yet')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        actions: [
          GestureDetector(
            child: const Icon(
              Icons.ads_click_rounded,
              color: Colors.white,
              size: 41,
            ),
            onTap: _showInterstitialAd,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.weatherForecasts.isNotEmpty) {
            return WeatherForecastWidget(forecasts: state.weatherForecasts);
          } else {
            return const Center(child: Text('No weather data available.'));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    interstitialAd?.dispose();
    super.dispose();
  }
}
