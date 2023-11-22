import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:health_4_all/features/mainHome/main_home_model.dart';

class MainHomeViewModel extends ChangeNotifier {
  String userName = 'Joao';

  List<UBSModel> ubsList = [];

  MainHomeViewModel() {
    // Carregando os dados do arquivo JSON
    String jsonString = '''
    [
      {"name": "UBS São Paulo 1", "location": "São Paulo, SP"},
      {"name": "UBS São Paulo 2", "location": "São Paulo, SP"},
      {"name": "UBS São Paulo 3", "location": "São Paulo, SP"},
      {"name": "UBS São Paulo 4", "location": "São Paulo, SP"}
    ]
    ''';

    List<dynamic> jsonList = json.decode(jsonString);

    ubsList = jsonList.map((json) => UBSModel.fromJson(json)).toList();
  }
}
