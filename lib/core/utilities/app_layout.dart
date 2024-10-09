import 'package:get/get.dart';

class AppLayout {
  /// This method takes [width] in pixels, then calculate the ratio between `width`
  /// and the fixed value of 1920 pixels, and finally multiplying the ratio by the current
  /// `MediaQuery` screen width value.
  static double width(double width) {
    double percentage = width / 1920;
    return Get.mediaQuery.size.width * percentage;
  }

  /// This method takes [height] in pixels, then calculate the ratio between `height`
  /// and the fixed value of 1080 pixels, and finally multiplying the ratio by the current
  /// `MediaQuery` screen height value.
  static double height(double height) {
    double percentage = height / 1080;
    return Get.mediaQuery.size.height * percentage;
  }
}
