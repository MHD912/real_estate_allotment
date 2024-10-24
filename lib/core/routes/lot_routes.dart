import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/utilities/app_bindings.dart';
import 'package:real_estate_allotment/views/lots/add_lot_view/add_lot_view.dart';
import 'package:real_estate_allotment/views/lots/edit_lot_view/edit_lot_view.dart';
import 'package:real_estate_allotment/views/lots/find_lot_view/find_lot_view.dart';

class LotRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.addLot,
      page: () => AddLotView(),
      binding: AddLotBindings(),
    ),
    GetPage(
      name: AppRoutes.findLot,
      page: () => FindLotView(),
      bindings: [
        FindLotBindings(),
        FindAnimationControllerBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.editLot,
      page: () => EditLotView(),
      binding: EditLotBindings(),
    ),
  ];
}
