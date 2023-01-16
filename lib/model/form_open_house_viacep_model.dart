import 'dart:convert';

FormOpenHouseViaCep FormOpenHouseViaCepFromJson(String str) => FormOpenHouseViaCep.fromJson(json.decode(str));

String FormOpenHouseViaCepToJson(FormOpenHouseViaCep data) => json.encode(data.toJson());

class FormOpenHouseViaCep {
  FormOpenHouseViaCep({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;

  factory FormOpenHouseViaCep.fromJson(Map<String, dynamic> json) => FormOpenHouseViaCep(
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
      );

  Map<String, dynamic> toJson() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
      };


}
