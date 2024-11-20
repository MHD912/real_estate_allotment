import 'package:get/get.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class PropertyDetailsController extends GetxController {
  RealEstate property;

  PropertyDetailsController({
    required this.property,
  });

  void updateRemainingValue() {
    update(['value']);
  }

  void updateRemainingShare() {
    update(['share']);
  }
}
