import 'package:get/get.dart';
import '../model/form_open_house_sample_model.dart';

class FormOpenHouseSampleController extends GetxController {
  List<FormOpenHouseSample> _newFormOpenHouseSample =
      List<FormOpenHouseSample>.empty(growable: true).obs;

  List<FormOpenHouseSample> get newFormOpenHouseSample => _newFormOpenHouseSample;

  void add(FormOpenHouseSample item) {
    _newFormOpenHouseSample.add(item);
  }

  void remove(FormOpenHouseSample item) {
    _newFormOpenHouseSample.remove(item);
  }
}
