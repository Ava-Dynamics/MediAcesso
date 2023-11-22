class MyOrderModel {
  final List<OrderItem> selectedItems;

  MyOrderModel({required this.selectedItems});
}

class OrderItem {
  final String itemName;
  final int quantity;

  OrderItem({required this.itemName, required this.quantity});
}