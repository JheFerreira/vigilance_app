import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/post_login_model.dart';
import '../service/login_service.dart';

class PostLoginHelper {
  Future<PostLogin?> signup(String username, String cpf, String telefone,
      String email, String password) async {
    LoginService _service = LoginService();
    PostLogin? token =
        await _service.insertSignup(username, cpf, telefone, email, password);
    if (token != null) {
      //se o login for diferente de null, estou salvando o usuário logado, o id e o username
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool("cadastrar", true);
      prefs.setString("username", token.username);
      return token;
    } else {
      return null;
    }
  }

  Future<PostLogin?> getAll(String username, String cpf,
      String telefone, String email, String senha) async {
    LoginService _service = LoginService();
    PostLogin? token =
        await _service.getAllUsers(username, cpf, telefone, email, senha);
    if (token != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool("buscar", true);
      prefs.setString("nome", token.username);
      return token;
    } else {
      return null;
    }
  }

  Future<PostLogin?> getByID(String username, String cpf,
      String telefone, String email, String senha) async {
    LoginService _service = LoginService();
    PostLogin? token =
        await _service.getUserByID(username, cpf, telefone, email, senha);
    if (token != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool("buscar", true);
      prefs.setString("nome", token.username);
      return token;
    } else {
      return null;
    }
  }

  Future<PostLogin?> update(String username, String cpf,
      String telefone, String email, String senha) async {
    LoginService _service = LoginService();
    PostLogin? token =
        await _service.insertUpdateUser(username, cpf, telefone, email, senha);
    if (token != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool("editar", true);
      prefs.setString("nome", token.username);
      return token;
    } else {
      return null;
    }
  }

  Future<PostLogin?> delete(String username, String cpf,
      String telefone, String email, String senha) async {
    LoginService _service = LoginService();
    PostLogin? token =
        await _service.getDeleteUser(username, cpf, telefone, email, senha);
    if (token != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool("deletar", true);
      prefs.setString("nome", token.username);
      return token;
    } else {
      return null;
    }
  }

  Future<bool> login(String username, String password) async {
    LoginService _service = LoginService();
    String? token = await _service.insertLogin(username, password);
    if (token != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("token", token);
      return true;
    } else {
      await logout();
      return false;
    }
  }

  //metodo para verificar se há esse elemento, e se ele é verdadeiro ou falso
  Future<bool> isUserLogged() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") == null ? false : true;
  }

  Future<bool> logout() async {
    LoginService _service = LoginService();
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    if (token != null) {
      bool response = await _service.insertLogout(token);
      if (response) {
        prefs.remove("token");
        Get.toNamed('/login');
        return true;
      }
      return false;
    }
    return false;
  }

  user(String nome, String cpf, String telefone, String email, String senha) {}
}
