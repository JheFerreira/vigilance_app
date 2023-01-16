import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/form_closed_house_model.dart';
import '../service/form_closed_house_service.dart';

class FormClosedHouseHelper {
  Future<List<FormClosedHouse>> getAll() async {
    FormClosedHouseService _service = FormClosedHouseService();
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");
    if (token != null) {
      return await _service.getAll(token);
    }
    return List.empty();
  }

  Future<bool?> getByID(int id) async {
    FormClosedHouseService _service = FormClosedHouseService();
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

  Future<bool?> add(FormClosedHouse formClosedHouse) async {
    FormClosedHouseService _service = FormClosedHouseService();
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    if (token != null) {
      return await _service.add(formClosedHouse, token);
    } else {
      prefs.remove('token');
      Get.toNamed('/login');
      return false;
    }
  }

  Future<bool?> update(FormClosedHouse formClosedHouse) async {
    FormClosedHouseService _service = FormClosedHouseService();
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    if (token != null) {
      return await _service.update(formClosedHouse, token);
    }
    return false;
  }

  Future<bool?> delete(FormClosedHouse formClosedHouse) async {
    FormClosedHouseService _service = FormClosedHouseService();
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    if (token != null) {
      return await _service.delete(formClosedHouse, token);
    }

    return false;
  }
}
