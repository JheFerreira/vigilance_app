import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/form_open_house_viacep_model.dart';

class FormOpenHouseViaCepService {
  Future<FormOpenHouseViaCep?> getEnderecoByCep(String cep) async {
    String url = 'https://viacep.com.br/ws/$cep/json/';
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 201) {
      String body = '"cep": "75689366"';
      var enderecoResponse = jsonDecode(response.body);

      var Endereco = FormOpenHouseViaCep(
          cep: enderecoResponse["cep"],
          logradouro: enderecoResponse["logradouro"],
          complemento: enderecoResponse["complemento"],
          bairro: enderecoResponse["bairro"],
          localidade: enderecoResponse["localidade"],
          uf: enderecoResponse["uf"]);
    } else {
      Exception("Falha na conexão com o servidor!");
    }
  }
}
