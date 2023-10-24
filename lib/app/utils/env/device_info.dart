import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DeviceInfo {
  factory DeviceInfo() {
    return _instance;
  }

  DeviceInfo._internal();

  static final DeviceInfo _instance = DeviceInfo._internal();

  // Min width of the normal tablet
  double minimumTabletWidth = 600;

  // Min width of the large tablet
  double minimumLargeTabletWidth = 744;

  // Height of the default device
  // double defaultHeight = 864;?\
  double defaultHeight = 677;

  bool _isTablet = false;

  bool _isSmallTablet = false;

  bool _isFirstCheckTablet = true;

  double _scale = 1.0;

  double _tabletShortestSide = 600;

  double scale() {
    return _scale;
  }

  double tabletShortestSide() {
    return _tabletShortestSide;
  }

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
    if (mediaQuery.size.shortestSide < minimumTabletWidth) {
      _isTablet = false;
      _isSmallTablet = false;
    } else if (mediaQuery.size.shortestSide < minimumLargeTabletWidth) {
      _isTablet = true;
      _isSmallTablet = true;
      _tabletShortestSide = mediaQuery.size.shortestSide;
    } else {
      _isTablet = true;
      _isSmallTablet = false;
      _tabletShortestSide = mediaQuery.size.shortestSide;
    }

    final scale = Get.width / defaultHeight;
    _scale = scale > 1.5 ? 1.5 : _scale;
  }
}
