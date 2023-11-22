import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:health_4_all/features/detailsUBSItems/detailUBSItems_model.dart';

class UBSItemViewModel extends ChangeNotifier {
  List<UBSItemModel> ubsItems = [
    UBSItemModel(itemName: 'Exemplo 1', isSelected: false),
    UBSItemModel(itemName: 'Exemplo 2', isSelected: false),
  ];

  List<UBSItemModel> selectedItems = [];

  UBSItemViewModel() {
    // Carregando os dados do arquivo JSON
    String jsonString = '''
    [
      {"itemName": "ATENOLOL 25MG", "isSelected": false},
      {"itemName": "CAPTOPRIL 25MG", "isSelected": false},
      {"itemName": "CLORIDRATO DE PROPRANOLOL 40MG", "isSelected": false},
      {"itemName": "HIDROCLOROTIAZIDA 25MG", "isSelected": false},
      {"itemName": "LOSARTANA POTÁSSICA 50MG", "isSelected": false},
      {"itemName": "MALEATO DE ENALAPRIL 10MG", "isSelected": false},
      {"itemName": "GLIBENCLAMIDA 5MG", "isSelected": false},
      {"itemName": "CLORIDRATO DE METFORMINA 500MG", "isSelected": false},
      {"itemName": "CLORIDRATO DE METFORMINA 500MG – AÇÃO PROLONGADA", "isSelected": false},
      {"itemName": "CLORIDRATO DE METFORMINA 850MG", "isSelected": false},
      {"itemName": "INSULINA HUMANA 100UI/ML", "isSelected": false},
      {"itemName": "INSULINA HUMANA REGULAR 100UI/ML", "isSelected": false},
      {"itemName": "SULFATO DE SALBUTAMOL 5MG", "isSelected": false},
      {"itemName": "SULFATO DE SALBUTAMOL 100MCG", "isSelected": false},
      {"itemName": "DIPROPIONATO DE BECLOMETSONA 50MCG", "isSelected": false},
      {"itemName": "DIPROPIONATO DE BECLOMETSONA 200MCG/DOSE", "isSelected": false},
      {"itemName": "DIPROPIONATO DE BECLOMETSONA 200MCG/CÁPSULA", "isSelected": false},
      {"itemName": "DIPROPIONATO DE BECLOMETSONA 250MCG", "isSelected": false},
      {"itemName": "BROMETO DE IPRATRÓPIO 0,25MG/ML", "isSelected": false},
      {"itemName": "BROMETO DE IPRATRÓPIO 0,02MG/DOSE", "isSelected": false}
    ]
    ''';

    List<dynamic> jsonList = json.decode(jsonString);

    ubsItems = jsonList
        .map((json) => UBSItemModel(
              itemName: json['itemName'] ?? '',
              isSelected: json['isSelected'] ?? false,
            ))
        .toList();
  }

  int get selectedCount => ubsItems.where((item) => item.isSelected).length;

  void toggleSelection(int index) {
  if (ubsItems[index].isSelected) {
    selectedItems.remove(ubsItems[index]);
  } else {
    selectedItems.add(UBSItemModel(
      itemName: ubsItems[index].itemName,
      isSelected: true,
    ));
  }
  ubsItems[index].isSelected = !ubsItems[index].isSelected;
  notifyListeners();
}

  List<UBSItemModel> getSelectedItems() {
    return ubsItems.where((item) => item.isSelected).toList();
  }
}
