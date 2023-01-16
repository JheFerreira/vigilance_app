import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../model/form_open_house_model.dart';

class FilePersistence {
  Future<File> _getLocalFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    String _localPath = diretorio.path;
    //essa linha garante que se não houver a pasta para guardar os arquivos, ele cria
    return File("$_localPath/listFormOpenHouse.json");
    //após isso , vai lá no model, FormOpenHouse.dart e cria um Map;
  }

  Future saveData(List<FormOpenHouse> formsOpenHouse) async {
    final localFile = await _getLocalFile();
    //cria uma lista
    List listFormOpenHouse = [];
    //add a lista ao toMap
    formsOpenHouse.forEach((foh) {
     listFormOpenHouse.add(foh.toJson());
    });
    String data = json.encode(listFormOpenHouse);
    return localFile.writeAsStringSync(data);
  }
  //para buscar todas as informações, faço o caminho contrario

  Future<List<FormOpenHouse>> getData() async {
    final localFile = await _getLocalFile();
    //json vou converter para data
    String data = await localFile.readAsString();
    List listFormOpenHouse = json.decode(data);

    List<FormOpenHouse> formsOpenHouse = [];

    listFormOpenHouse.forEach((mapFormOpenHouse) {
      formsOpenHouse.add(FormOpenHouse.fromJson(mapFormOpenHouse));
    });
    return formsOpenHouse;
  }
}