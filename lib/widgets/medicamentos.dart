// https://medium.com/flutter-community/implementing-auto-complete-search-list-a8dd192bd5f6

import 'dart:convert';
import 'package:flutter/services.dart';

class Medicamentos{
  String? keyword;
  int? id;
  String? autoCompleteTerm;
  String? presentacion;
  String? clave;

  Medicamentos({
    this.keyword,
    this.autoCompleteTerm, 
    this.id, 
    this.clave, 
    this.presentacion
  });

  factory Medicamentos.fromJson(Map<String, dynamic> parsedJson) {
    return Medicamentos(
      keyword: parsedJson["keyword"] as String,
      id: parsedJson["id"] as int,
      autoCompleteTerm: parsedJson["autoCompleteTerm"] as String,
      clave: parsedJson["clave"] as String,
      presentacion: parsedJson["presentacion"] as String
    );
  }
}

class MedicamentosViewModel{
  static List<Medicamentos>? medicamentos;

  static Future loadMedicamentos() async{
    try{
      medicamentos = [];
      String jsonString = await rootBundle.loadString('assets/claves.json'); //carga JSON
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson['medicamentos'] as List;
      for(int i = 0; i < categoryJson.length; i++){
        medicamentos?.add(Medicamentos.fromJson(categoryJson[i]));
      }
    } catch(e) {
      print(e);
    }
  }
}