import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_4_all/features/detailsUBSItems/detailsUBSItems_view_model.dart';
import 'package:health_4_all/features/mainHome/main_home_model.dart';
import 'package:health_4_all/features/myOrder/myOrder_view.dart';
import 'package:health_4_all/features/myOrder/myOrder_model.dart';

class UBSItemView extends StatelessWidget {
  final UBSModel ubs;

  UBSItemView({required this.ubs});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UBSItemViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('UBS Items'),
          actions: [
            _buildOrderButton(context),
          ],
        ),
        body: _buildUBSItemList(),
      ),
    );
  }

  Widget _buildOrderButton(BuildContext context) {
  return Consumer<UBSItemViewModel>(
    builder: (context, viewModel, child) {
      int selectedCount = viewModel.selectedCount;
      return Stack(
        children: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Converta a lista de UBSItemModel para OrderItem
              List<OrderItem> orderItems = viewModel.selectedItems.map((ubsItem) {
                return OrderItem(
                  itemName: ubsItem.itemName,
                  quantity: 1, // Você pode ajustar a quantidade conforme necessário
                );
              }).toList();

              // Agora você pode passar orderItems para MyOrderView
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyOrderView(selectedItems: orderItems),
                ),
              );
            },
          ),
          Positioned(
            right: 5,
            top: 5,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                selectedCount.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    },
  );
}

  Widget _buildUBSItemList() {
    return Consumer<UBSItemViewModel>(
      builder: (context, viewModel, child) {
        return ListView.builder(
          itemCount: viewModel.ubsItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 8.0),
                  Flexible(
                    child: Text(
                      viewModel.ubsItems[index].itemName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
              onTap: () {
                viewModel.toggleSelection(index);
              },
            );
          },
        );
      },
    );
  }
}
