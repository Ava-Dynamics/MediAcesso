import 'package:flutter/material.dart';
import 'package:health_4_all/features/myOrder/myOrder_model.dart';

class MyOrderViewModel extends ChangeNotifier {
  List<OrderItem> selectedItems = [];

  void addItem(String itemName, int quantity) {
    final existingItemIndex =
        selectedItems.indexWhere((item) => item.itemName == itemName);

    if (existingItemIndex != -1) {
      // Se o item já existe, atualize a quantidade
      selectedItems[existingItemIndex] =
          OrderItem(itemName: itemName, quantity: quantity);
    } else {
      // Caso contrário, adicione um novo item
      selectedItems.add(OrderItem(itemName: itemName, quantity: quantity));
    }

    notifyListeners();
  }
  
}
