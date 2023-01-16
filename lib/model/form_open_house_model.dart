import 'dart:convert';
import 'package:app_vigilance/model/form_open_house_part_model.dart';
import 'package:app_vigilance/model/form_open_house_sample_model.dart';

FormOpenHouse FormOpenHouseFromJson(String str) =>
    FormOpenHouse.fromJson(json.decode(str));

String FormOpenHouseToJson(FormOpenHouse data) => json.encode(data.toJson());

class FormOpenHouse {
  FormOpenHouse({
    this.id,
    required this.nomeCompleto,
    required this.telefone,
    required this.email,
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.larva,
    required this.pupa,
    required this.quantidadeLarva,
    required this.codigoDeposito,
    required this.deposito,
    required this.especie,
  });

  String? id;
  String nomeCompleto;
  String telefone;
  String email;
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String cidade;
  String estado;
  String larva;
  String pupa;
  String quantidadeLarva;
  String codigoDeposito;
  String deposito;
  String especie;
  bool done = false;

  factory FormOpenHouse.fromJson(Map<String, dynamic> json) => FormOpenHouse(
        id: json['_id'],
        nomeCompleto: json["nomeCompleto"],
        telefone: json["telefone"],
        email: json["email"],
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        cidade: json["cidade"],
        estado: json["estado"],
        larva: json["larva"],
        pupa: json["pupa"],
        quantidadeLarva: json["quantidadeLarva"],
        codigoDeposito: json["codigoDeposito"],
        deposito: json["deposito"],
        especie: json["especie"],
      );

  factory FormOpenHouse.fromParts(FormOpenHousePart formOpenHousePart,
          FormOpenHouseSample formOpenHouseSample) =>
      FormOpenHouse(
          id: formOpenHousePart.id,
          nomeCompleto: formOpenHousePart.nomeCompleto,
          telefone: formOpenHousePart.telefone,
          email: formOpenHousePart.email,
          cep: formOpenHousePart.cep,
          logradouro: formOpenHousePart.logradouro,
          complemento: formOpenHousePart.complemento,
          bairro: formOpenHousePart.bairro,
          cidade: formOpenHousePart.cidade,
          estado: formOpenHousePart.estado,
          larva: formOpenHouseSample.larva,
          pupa: formOpenHouseSample.pupa,
          quantidadeLarva: formOpenHouseSample.quantidadeLarva,
          codigoDeposito: formOpenHouseSample.codigoDeposito,
          deposito: formOpenHouseSample.deposito,
          especie: formOpenHouseSample.especie);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nomeCompleto": nomeCompleto,
        "telefone": telefone,
        "email": email,
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "cidade": cidade,
        "estado": estado,
        "larva": larva,
        "pupa": pupa,
        "quantidadeLarva": quantidadeLarva,
        "codigoDeposito": codigoDeposito,
        "deposito": deposito,
        "especie": especie,
      };
}
