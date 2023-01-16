import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/post_login_model.dart';

class LoginService {
  final String URL = '192.168.0.57';

  Future<List<PostLogin>> fetchPosts({int? userId}) async {
    final url = userId != null
        ? await 'http://$URL:3000/login/posts?userId=$userId'
        : await 'http://$URL:3000/login/posts';
    final response = await http.get(Uri.parse(url));
    List<PostLogin> posts = List<PostLogin>.empty(growable: true);

    if (response.statusCode == 200) {
      List resList = jsonDecode(response.body)['token'];

      resList.forEach((mPost) {
        posts.add(PostLogin.fromJson(mPost));
      });
    }
    return posts;
  }

  Future<PostLogin?> insertSignup(String username, String cpf, String telefone,
      String email, String password) async {
    Uri url = Uri.parse('http://$URL:3000/login/signup');
    http.post(url, body: {
      "username": username,
      "cpf": cpf,
      "telefone": "telefone",
      "email": email,
      "password": password
    }).then((response) {
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['token'];
      } else {
        Exception("Falha na conexão com o servidor!");
      }
    });
  }

  Future<PostLogin?> getAllUsers(String nome, String cpf, String telefone,
      String email, String senha) async {
    Uri url = Uri.parse('http://$URL/login/getAllUsers');
    http.post(url, body: {
      "nome": nome,
      "cpf": cpf,
      "telefone": telefone,
      "email": email,
      "senha": senha
    }).then((response) {
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['token'];
      } else {
        Exception("Falha na conexão com o servidor!");
      }
    });
  }

  Future<PostLogin?> getUserByID(String nome, String cpf, String telefone,
      String email, String senha) async {
    Uri url = Uri.parse('http://$URL:3000/login/getUserByID/:id');
    http.post(url, body: {
      "nome": nome,
      "cpf": cpf,
      "telefone": telefone,
      "email": email,
      "senha": senha
    }).then((response) {
      print("Chamando url de cadastrar usuário");
      print(response);
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['token'];
      } else {
        Exception("Falha na conexão com o servidor!");
      }
    });
  }

  Future<PostLogin?> insertUpdateUser(String nome, String cpf, String telefone,
      String email, String senha) async {
    Uri url = Uri.parse('http://$URL:3000/login/updateUser/:id');
    http.post(url, body: {
      "nome": nome,
      "cpf": cpf,
      "telefone": telefone,
      "email": email,
      "senha": senha
    }).then((response) {
      print("Chamando url de cadastrar usuário");
      print(response);
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['token'];
      } else {
        Exception("Falha na conexão com o servidor!");
      }
    });
  }

  Future<PostLogin?> getDeleteUser(String nome, String cpf, String telefone,
      String email, String senha) async {
    Uri url = Uri.parse('http://$URL:3000/login/deleteUser/:id');
    http.post(url, body: {
      "nome": nome,
      "cpf": cpf,
      "telefone": telefone,
      "email": email,
      "senha": senha
    }).then((response) {
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['token'];
      } else {
        Exception("Falha na conexão com o servidor!");
      }
    });
  }

  Future<String?> insertLogin(String username, String password) async {
    Uri url = Uri.parse('http://$URL:3000/login/login');
    var response = await http
        .post(url, body: {"username": username, "password": password});
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['token'];
    } else {
      Exception("Falha na conexão com o servidor!");
      print(response.body);
    }
  }

  Future<bool> insertLogout(String token) async {
    Uri url = Uri.parse('http://$URL:3000/login/logout');
    Map<String, String> requestHeaders = {'Authorization': 'Bearer ' + token};
    var response = await http.post(url, body: {}, headers: requestHeaders);
    if (response.statusCode == 200) {
      return true;
    } else {
      Exception("Falha na conexão com o servidor!");
      return false;
    }
  }
}
