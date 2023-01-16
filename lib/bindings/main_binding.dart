import 'package:get/get.dart';
import '../repositories/form_open_house_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FormOpenHouseController());
  }
}
