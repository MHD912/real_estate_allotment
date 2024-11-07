import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/properties/choose_property_controller.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/views/allotments/widgets/allotment_item_widget.dart';

class PropertyAllotmentItemWidget extends AllotmentItemWidget {
  PropertyAllotmentItemWidget({
    super.key,
    required super.index,
    required super.allotment,
  }) : super(
          allotedObject: Get.find<ChoosePropertyController>().property!,
        );

  @override
  void onPressedEditButton() {
    Get.toNamed(
      AppRoutes.editPropertyAllotment,
      arguments: {
        'allotment': allotment,
      },
    );
  }
}
