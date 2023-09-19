import 'package:flutter/cupertino.dart';

class TabletInfo {
  factory TabletInfo() {
    return _instance;
  }

  TabletInfo._internal();

  static final TabletInfo _instance = TabletInfo._internal();

  // Min width of the normal tablet
  double minimumTabletWidth = 600;

  // Min width of the large tablet
  double minimumLargeTabletWidth = 744;

  bool _isTablet = false;

  bool _isSmallTablet = false;

  bool _isFirstCheckTablet = true;

  bool isTablet() {
    return _isTablet;
  }

  bool isSmallTablet() {
    return _isSmallTablet;
  }

  bool isPhone() {
    return !_isTablet;
  }

  void initCheckTablet(BuildContext context) {
    if (!_isFirstCheckTablet) {
      return;
    }
    _isFirstCheckTablet = false;
    final mediaQuery = MediaQuery.of(context);
    if (mediaQuery.size.width < minimumTabletWidth) {
      _isTablet = false;
    } else if (mediaQuery.size.width < minimumLargeTabletWidth) {
      _isTablet = true;
      _isSmallTablet = true;
    } else {
      _isTablet = true;
    }
  }
}
