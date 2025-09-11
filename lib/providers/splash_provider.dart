import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  bool _isAnimationComplete = false;
  bool _isNavigationReady = false;

  bool get isAnimationComplete => _isAnimationComplete;
  bool get isNavigationReady => _isNavigationReady;

  void setAnimationComplete() {
    _isAnimationComplete = true;
    notifyListeners();
  }

  void setNavigationReady() {
    _isNavigationReady = true;
    notifyListeners();
  }

  void reset() {
    _isAnimationComplete = false;
    _isNavigationReady = false;
    notifyListeners();
  }
}
