import 'package:shared_preferences/shared_preferences.dart';
import '../model/form_open_house_viacep_model.dart';
import '../service/form_open_house_viacep_service.dart';

class FormOpenHouseViaCepHelper {
  Future<FormOpenHouseViaCep> getCep(
      cep, logradouro, complemento, bairro, localidade, uf) async {
    FormOpenHouseViaCepService _service = FormOpenHouseViaCepService();
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("logged") != null) {}
    return cep;
  }
}
