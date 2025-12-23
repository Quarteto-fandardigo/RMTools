// Sempre que você quiser persistir algo, siga exatamente esta sequência:

// Objeto
//   ↓ toJson()
// Map<String, dynamic>
//   ↓ jsonEncode()
// String
//   ↓ writeAsString()
// Arquivo .json


// E para carregar:

// Arquivo .json
//   ↓ readAsString()
// String
//   ↓ jsonDecode()
// Map<String, dynamic>
//   ↓ fromJson()
// Objeto


// Se você respeitar isso, não tem como dar errado.



import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:rmtools/model/fichaModel/ficha.dart';

class FichaRepository {

  Future<File> _file() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/ficha.json');
  }

  Future<void> salvar(Ficha ficha) async {
    final file = await _file();
    final jsonString = jsonEncode(ficha.toJson());
    await file.writeAsString(jsonString);
  }

  Future<Ficha?> carregar() async {
    final file = await _file();

    if (!await file.exists()) return null;

    final jsonString = await file.readAsString();
    final jsonMap = jsonDecode(jsonString);

    return Ficha.fromJson(jsonMap);
  }


  Future<T?> carregarCampo<T>(String campo) async {
  final file = await _file();
  if (!await file.exists()) return null;

  final jsonMap = jsonDecode(await file.readAsString());
  return jsonMap[campo] as T?;
}



}







