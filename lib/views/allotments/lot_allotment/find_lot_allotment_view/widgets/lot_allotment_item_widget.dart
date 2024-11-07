import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/views/allotments/widgets/allotment_item_widget.dart';

class LotAllotmentItemWidget extends AllotmentItemWidget {
  LotAllotmentItemWidget({
    super.key,
    required super.index,
    required super.allotment,
  }) : super(allotedObject: Object());

  @override
  void onPressedEditButton() {
    Get.toNamed(
      AppRoutes.editLotAllotment,
      arguments: {
        'allotment': allotment,
      },
    );
  }
}
