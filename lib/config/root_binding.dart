import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';


class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => (), fenix: true);

  }
}