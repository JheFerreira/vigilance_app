import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/form_closed_house_model.dart';

class FormClosedHouseService {
  final String URL = ' 192.168.0.57';

  Future<List<FormClosedHouse>> getAll(String token) async {
    Map<String, String> requestHeaders = {'Authorization': 'Bearer ' + token};
    Uri url =
        Uri.parse('http://$URL:3000/formClosedHouse/getAllformClosedHouse');
    var response = await http.get(url, headers: requestHeaders);
    final List<dynamic> decodedJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return decodedJson
          .map((dynamic json) => FormClosedHouse.fromJson(json))
          .toList();
    } else {
      throw new Exception("Falha na conexão com o servidor!");
    }
  }

  Future<bool> getByID(int id, String token) async {
    Map<String, String> requestHeaders = {'Authorization': 'Bearer ' + token};
    Uri url = Uri.parse(
        'http://$URL:3000/formClosedHouse/getformClosedHouseByID/${id.toString}');
    var response = await http.get(url, headers: requestHeaders);
    final List<dynamic> decodedJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      Exception("Falha na conexão com o servidor!");
      return false;
    }
  }

  Future<bool> add(FormClosedHouse formClosedHouse, String token) async {
    Map<String, String> requestHeaders = {'Authorization': 'Bearer ' + token};
    Uri url = Uri.parse('http://$URL:3000/formClosedHouse/addformClosedHouse');
    var response = await http.post(url,
        body: {
          "data": formClosedHouse.data,
          "cep": formClosedHouse.cep,
          "logradouro": formClosedHouse.logradouro,
          "complemento": formClosedHouse.complemento,
          "bairro": formClosedHouse.bairro,
          "cidade": formClosedHouse.cidade,
          "estado": formClosedHouse.estado,
          "retorno": formClosedHouse.retorno
        },
        headers: requestHeaders);

    if (response.statusCode == 201) {
      return true;
    } else {
      Exception("Falha na conexão com o servidor!");
      return false;
    }
  }

  Future<bool> update(FormClosedHouse formClosedHouse, String token) async {
    Map<String, String> requestHeaders = {'Authorization': 'Bearer ' + token};
    Uri url = Uri.parse(
        'http://$URL:3000/formClosedHouse/updateformClosedHouse/${formClosedHouse.id}');
    var response = await http.put(url,
        body: {
          "data": formClosedHouse.data,
          "cep": formClosedHouse.cep,
          "logradouro": formClosedHouse.logradouro,
          "complemento": formClosedHouse.complemento,
          "bairro": formClosedHouse.bairro,
          "cidade": formClosedHouse.cidade,
          "estado": formClosedHouse.estado,
          "retorno": formClosedHouse.retorno
        },
        headers: requestHeaders);

    if (response.statusCode == 200) {
      return true;
    } else {
      Exception("Falha na conexão com o servidor!");
      return false;
    }
  }

  Future<bool> delete(FormClosedHouse formClosedHouse, String token) async {
    Map<String, String> requestHeaders = {'Authorization': 'Bearer ' + token};
    Uri url = Uri.parse(
        'http://$URL:3000/formClosedHouse/deleteformClosedHouse/${formClosedHouse.id}');
    var response = await http.delete(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return true;
    } else {
      Exception("Falha na conexão com o servidor!");
      return false;
    }
  }
}
