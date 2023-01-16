import 'package:get/get.dart';
import '../model/form_open_house_model.dart';

class FormOpenHouseController extends GetxController {
  List<FormOpenHouse> _newFormOpenHouse =
      List<FormOpenHouse>.empty(growable: true).obs;

  List<FormOpenHouse> get newFormOpenHouse => _newFormOpenHouse;

  void add(FormOpenHouse item) {
    _newFormOpenHouse.add(item);
  }

  void remove(FormOpenHouse item) {
    _newFormOpenHouse.remove(item);
  }
}
