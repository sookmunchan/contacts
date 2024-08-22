import 'package:contacts/screens/splashscreen/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashscreenController>(SplashscreenController());
  }
}
