import 'dart:async';
import 'dart:convert';

FormClosedHouse FormClosedHouseFromJson(String str) =>
    FormClosedHouse.fromJson(json.decode(str));

String FormClosedHouseToJson(FormClosedHouse data) =>
    json.encode(data.toJson());

class FormClosedHouse {
  FormClosedHouse({
    this.id,
    required this.data,
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.retorno,
  });

  String? id;
  String data;
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String cidade;
  String estado;
  String retorno;
  bool done = false;

  factory FormClosedHouse.fromJson(Map<String, dynamic> json) =>
      FormClosedHouse(
        id: json['_id'],
        data: json["data"],
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        cidade: json["cidade"],
        estado: json["estado"],
        retorno: json["retorno"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "data": data,
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "cidade": cidade,
        "estado": estado,
        "retorno": retorno,
      };
}
