import 'dart:io';

class AdService {
  static final AdService instance = AdService._internal();

  factory AdService() {
    return instance;
  }

  AdService._internal();

  /// TEST ANDROID REWARDED AD ID: ca-app-pub-3940256099942544/5224354917
  /// TEST ANDROID INTERSTITIAL AD ID: ca-app-pub-3940256099942544/1033173712
  /// TEST ANDROID BANNER AD ID: ca-app-pub-3940256099942544/6300978111

  String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-1229600046040111/6674167281'; // Test ID
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716'; // Test ID
    }
    throw UnsupportedError("Unsupported platform");
  }

  String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-1229600046040111/6892152536'; // Test ID
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910'; // Test ID
    }
    throw UnsupportedError("Unsupported platform");
  }
}
