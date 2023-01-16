import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/form_open_house_model.dart';
import '../service/form_open_house_service.dart';

class FormOpenHouseHelper {
  Future<List<FormOpenHouse>> getAll() async {
    FormOpenHouseService _service = FormOpenHouseService();
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");
    if (token != null) {
      return await _service.getAll(token);
    }
    return List.empty();
  }

  Future<bool?> getByID(int id) async {
    FormOpenHouseService _service = FormOpenHouseService();
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    if (token != null) {
      _service.getByID(id, token);
    }
    if (token != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool("buscar", true);
      prefs.setString("token", token);
      return true;
    } else {
      return null;
    }
  }

  Future<bool?> add(FormOpenHouse formOpenHouse) async {
    FormOpenHouseService _service = FormOpenHouseService();
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    if (token != null) {
      return await _service.add(formOpenHouse, token);
    } else {
      prefs.remove('token');
      Get.toNamed('/login');
      return false;
    }
  }

  Future<bool?> update(FormOpenHouse formOpenHouse) async {
    FormOpenHouseService _service = FormOpenHouseService();
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    if (token != null) {
      return await _service.update(formOpenHouse, token);
    }
    return false;
  }

  Future<bool?> delete(FormOpenHouse formOpenHouse) async {
    FormOpenHouseService _service = FormOpenHouseService();
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    if (token != null) {
      return await _service.delete(formOpenHouse, token);
    }

    return false;
  }
}
