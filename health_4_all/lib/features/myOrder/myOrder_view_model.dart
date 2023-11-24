import 'package:flutter/material.dart';
import 'package:health_4_all/features/myOrder/myOrder_model.dart';

class MyOrderViewModel extends ChangeNotifier {
  List<OrderItem> selectedItems;

  MyOrderViewModel({required this.selectedItems});

  void addItem(String itemName, int quantity) {
    final existingItemIndex =
        selectedItems.indexWhere((item) => item.itemName == itemName);

    if (existingItemIndex != -1) {
      selectedItems[existingItemIndex] =
          OrderItem(itemName: itemName, quantity: quantity);
    } else {
      selectedItems.add(OrderItem(itemName: itemName, quantity: quantity));
    }

    notifyListeners();
  }
}