import 'package:get/get.dart';
import 'package:wasata/controller/auth_controller.dart';
import 'package:wasata/controller/home_controller.dart';
import 'package:wasata/controller/layout_controller.dart';
import 'package:wasata/controller/map_controller.dart';
import 'package:wasata/controller/on_boarding_controller.dart';

class Binding extends Bindings
{
  @override
  void dependencies() {
    Get.put(OnBoardingController());
    Get.put(AuthController());
    Get.put(LayoutController());
    Get.put(HomeController());
    Get.put(MapController());

  }

}