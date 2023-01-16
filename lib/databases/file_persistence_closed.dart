import 'dart:convert';
import 'dart:io';
import 'package:app_vigilance/model/form_closed_house_model.dart';
import 'package:path_provider/path_provider.dart';

class FilePersistence {
  Future<File> _getLocalFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    String _localPath = diretorio.path;
    //essa linha garante que se não houver a pasta para guardar os arquivos, ele cria
    return File("$_localPath/listFormClosedHouse.json");
    //após isso , vai lá no model, FormClosedHouse.dart e cria um Map;
  }

  Future saveData(List<FormClosedHouse> formsClosedHouse) async {
    final localFile = await _getLocalFile();
    //cria uma lista
    List listFormClosedHouse = [];
    //add a lista ao toMap
    formsClosedHouse.forEach((foh) {
     listFormClosedHouse.add(foh.toJson());
    });
    String data = json.encode(listFormClosedHouse);
    return localFile.writeAsStringSync(data);
  }
  //para buscar todas as informações, faço o caminho contrario

  Future<List<FormClosedHouse>> getData() async {
    final localFile = await _getLocalFile();
    //json vou converter para data
    String data = await localFile.readAsString();
    List listFormClosedHouse = json.decode(data);

    List<FormClosedHouse> formsClosedHouse = [];

    listFormClosedHouse.forEach((mapFormClosedHouse) {
      formsClosedHouse.add(FormClosedHouse.fromJson(mapFormClosedHouse));
    });
    return formsClosedHouse;
  }
}