import 'package:get/get.dart';

class LotDetailsController extends GetxController {
  String city, propertyNumber, lotNumber;
  double remainingShare;

  LotDetailsController({
    required this.city,
    required this.propertyNumber,
    required this.lotNumber,
    required this.remainingShare,
  });

  void updateRemainingShare(double value) {
    remainingShare -= value;
    update();
  }
}
