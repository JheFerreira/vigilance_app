import 'dart:convert';

FormOpenHousePart FormOpenHousePartFromJson(String str) =>
    FormOpenHousePart.fromJson(json.decode(str));

String FormOpenHousePartToJson(FormOpenHousePart data) =>
    json.encode(data.toJson());

class FormOpenHousePart {
  FormOpenHousePart({
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
  bool done = false;

  factory FormOpenHousePart.fromJson(Map<String, dynamic> json) =>
      FormOpenHousePart(
        id: json["_id"],
        nomeCompleto: json["nomeCompleto"],
        telefone: json["telefone"],
        email: json["email"],
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        cidade: json["cidade"],
        estado: json["estado"],
      );

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
      };
}
