import 'package:get/get.dart';
import '../model/form_closed_house_model.dart';

class FormClosedHouseController extends GetxController {
  List<FormClosedHouse> _newFormClosedHouse =
      List<FormClosedHouse>.empty(growable: true).obs;

  List<FormClosedHouse> get newFormClosedHouse => _newFormClosedHouse;

  void add(FormClosedHouse item) {
    _newFormClosedHouse.add(item);
  }

  void remove(FormClosedHouse item) {
    _newFormClosedHouse.remove(item);
  }
}
