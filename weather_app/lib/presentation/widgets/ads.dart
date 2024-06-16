import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Ads extends StatefulWidget {
  const Ads({super.key});

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  RewardedAd? rewardedAd;
  final String rewardedAdUnitId = "ca-app-pub-4704157650909741/1234567890"; // Thay bằng đơn vị quảng cáo thực tế
  bool isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadRewardedAd();
  }

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdFailedToLoad: (LoadAdError error) {
          print("Failed, Error: $error");
          setState(() {
            isAdLoaded = false;
          });
        },
        onAdLoaded: (RewardedAd ad) {
          print('$ad loaded');
          setState(() {
            rewardedAd = ad;
            isAdLoaded = true;
          });
          _setFullScreenContentCallback(ad);
        },
      ),
    );
  }

  void _setFullScreenContentCallback(RewardedAd ad) {
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('$ad onAdShowedFullScreenContent'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent');
        ad.dispose();
        setState(() {
          isAdLoaded = false;
        });
        _loadRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        setState(() {
          isAdLoaded = false;
        });
        _loadRewardedAd();
      },
      onAdImpression: (RewardedAd ad) => print("$ad Impression occurred"),
    );
  }

  void _showRewardedAd() {
    if (isAdLoaded && rewardedAd != null) {
      rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
          num amount = rewardItem.amount;
          print("You earned: $amount");
        },
      );
    } else {
      print("Ad is not ready yet");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Task Manager",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          GestureDetector(
            child: Icon(
              Icons.notifications_outlined,
              color: Colors.black,
              size: 41,
            ),
            onTap: _showRewardedAd,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Center(
        child: InkWell(
          onTap: _showRewardedAd,
          child: Icon(
            Icons.notifications_outlined,
            color: Colors.black,
            size: 41,
          ),
        ),
      ),
    );
  }
}
