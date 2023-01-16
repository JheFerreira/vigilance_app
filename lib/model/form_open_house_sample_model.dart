import 'dart:convert';

FormOpenHouseSample FormOpenHouseSampleFromJson(String str) => FormOpenHouseSample.fromJson(json.decode(str));

String FormOpenHouseSampleToJson(FormOpenHouseSample data) => json.encode(data.toJson());

class FormOpenHouseSample {
    FormOpenHouseSample({
       required this.larva,
       required this.pupa,
       required this.quantidadeLarva,
       required this.codigoDeposito,
       required this.deposito,
       required this.especie,
    });

    String larva;
    String pupa;
    String quantidadeLarva;
    String codigoDeposito;
    String deposito;
    String especie;
    bool done = false;

    factory FormOpenHouseSample.fromJson(Map<String, dynamic> json) => FormOpenHouseSample(
        larva: json["larva"],
        pupa: json["pupa"],
        quantidadeLarva: json["quantidadeLarva"],
        codigoDeposito: json["codigoDeposito"],
        deposito: json["deposito"],
        especie: json["especie"],
    );

    Map<String, dynamic> toJson() => {
        "larva": larva,
        "pupa": pupa,
        "quantidadeLarva": quantidadeLarva,
        "codigoDeposito": codigoDeposito,
        "deposito": deposito,
        "especie": especie,
    };
}
