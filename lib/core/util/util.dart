import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class Utils {

  static double resizeWidthUtil(double value) {
    var screenWidth = MediaQuery.of(getContext()).size.width;
    var screenDesignWidth = 750;
    return (screenWidth * value) / screenDesignWidth;
  }

  static double resizeHeightUtil(double value) {
    var screenHeight = MediaQuery.of(getContext()).size.height;
    var screenDesignHeight = 1344;
    return (screenHeight * value) / screenDesignHeight;
  }

  static BuildContext getContext() {
    return navigatorKey.currentState.overlay.context;
  }
}