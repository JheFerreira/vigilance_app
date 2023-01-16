import 'dart:convert';

PostLogin postLoginFromJson(String str) => PostLogin.fromJson(json.decode(str));

String postLoginToJson(PostLogin data) => json.encode(data.toJson());

class PostLogin {
    PostLogin({
      required this.username,
       required this.cpf,
       required this.telefone,
       required this.email,
       required this.password,
    });

    String username;
    String cpf;
    String telefone;
    String email;
    String password;
    bool done = false;

    factory PostLogin.fromJson(Map<String, dynamic> json) => PostLogin(
        username: json["username"],
        cpf: json["cpf"],
        telefone: json["telefone"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "cpf": cpf,
        "telefone": telefone,
        "email": email,
        "password": password,
    };
}
