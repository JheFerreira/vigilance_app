import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/form_open_house_model.dart';

class FormOpenHouseService {
  final String URL = ' 192.168.0.57';

  Future<List<FormOpenHouse>> getAll(String token) async {
    Map<String, String> requestHeaders = {'Authorization': 'Bearer ' + token};
    Uri url = Uri.parse('http://$URL:3000/formOpenHouse/getAllformOpenHouse');
    var response = await http.get(url, headers: requestHeaders);
    final List<dynamic> decodedJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return decodedJson
          .map((dynamic json) => FormOpenHouse.fromJson(json))
          .toList();
    } else {
      throw new Exception("Falha na conexão com o servidor!");
    }
  }

  Future<bool> getByID(int id, String token) async {
    Map<String, String> requestHeaders = {'Authorization': 'Bearer ' + token};
    Uri url = Uri.parse(
        'http://$URL:3000/formOpenHouse/getformOpenHouseByID/${id.toString}');
    var response = await http.get(url, headers: requestHeaders);
    final List<dynamic> decodedJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      Exception("Falha na conexão com o servidor!");
      return false;
    }
  }

  Future<bool> add(FormOpenHouse formOpenHouse, String token) async {
    Map<String, String> requestHeaders = {'Authorization': 'Bearer ' + token};
    Uri url = Uri.parse('http://$URL:3000/formOpenHouse/addformOpenHouse');
    var response = await http.post(url,
        body: {
          "nomeCompleto": formOpenHouse.nomeCompleto,
          "telefone": formOpenHouse.telefone,
          "email": formOpenHouse.email,
          "cep": formOpenHouse.cep,
          "logradouro": formOpenHouse.logradouro,
          "complemento": formOpenHouse.complemento,
          "bairro": formOpenHouse.bairro,
          "cidade": formOpenHouse.cidade,
          "estado": formOpenHouse.estado,
          "larva": formOpenHouse.larva,
          "pupa": formOpenHouse.pupa,
          "quantidadeLarva": formOpenHouse.quantidadeLarva,
          "codigoDeposito": formOpenHouse.codigoDeposito,
          "deposito": formOpenHouse.deposito,
          "especie": formOpenHouse.especie
        },
        headers: requestHeaders);

    if (response.statusCode == 201) {
      return true;
    } else {
      Exception("Falha na conexão com o servidor!");
      return false;
    }
  }

  Future<bool> update(FormOpenHouse formOpenHouse, String token) async {
    Map<String, String> requestHeaders = {'Authorization': 'Bearer ' + token};
    Uri url = Uri.parse(
        'http://$URL:3000/formOpenHouse/updateformOpenHouse/${formOpenHouse.id}');
    var response = await http.put(url,
        body: {
          "nomeCompleto": formOpenHouse.nomeCompleto,
          "telefone": formOpenHouse.telefone,
          "email": formOpenHouse.email,
          "cep": formOpenHouse.cep,
          "endereco": formOpenHouse.logradouro,
          "complemento": formOpenHouse.complemento,
          "bairro": formOpenHouse.bairro,
          "cidade": formOpenHouse.cidade,
          "estado": formOpenHouse.estado,
          "larva": formOpenHouse.larva,
          "pupa": formOpenHouse.pupa,
          "quantidadeLarva": formOpenHouse.quantidadeLarva,
          "codigoDeposito": formOpenHouse.codigoDeposito,
          "deposito": formOpenHouse.deposito,
          "especie": formOpenHouse.especie
        },
        headers: requestHeaders);

    if (response.statusCode == 200) {
      return true;
    } else {
      Exception("Falha na conexão com o servidor!");
      return false;
    }
  }

  Future<bool> delete(FormOpenHouse formOpenHouse, String token) async {
    Map<String, String> requestHeaders = {'Authorization': 'Bearer ' + token};
    Uri url = Uri.parse(
        'http://$URL:3000/formOpenHouse/deleteformOpenHouse/${formOpenHouse.id}');
    var response = await http.delete(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return true;
    } else {
      Exception("Falha na conexão com o servidor!");
      return false;
    }
  }
}
