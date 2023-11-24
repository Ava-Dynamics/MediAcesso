import 'package:flutter/material.dart';
import 'package:health_4_all/features/orderRequested/orderRequested_view.dart';
import 'package:provider/provider.dart';
import 'package:health_4_all/features/myOrder/myOrder_view_model.dart';
import 'package:health_4_all/features/myOrder/myOrder_model.dart';

class MyOrderView extends StatelessWidget {
  final List<OrderItem> selectedItems;

  MyOrderView({required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyOrderViewModel>(
      create: (context) => MyOrderViewModel(selectedItems: selectedItems),
      child: _MyOrderView(),
    );
  }
}

class _MyOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyOrderViewModel viewModel = Provider.of<MyOrderViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Itens selecionados:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            _buildSelectedItemsList(context),
            SizedBox(height: 16.0),
            _buildFinishOrderButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedItemsList(BuildContext context) {
    MyOrderViewModel viewModel = Provider.of<MyOrderViewModel>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: viewModel.selectedItems.length,
      itemBuilder: (context, index) {
        OrderItem orderItem = viewModel.selectedItems[index];
        return ListTile(
          title: Text(orderItem.itemName),
          subtitle: Text('Quantidade: ${orderItem.quantity}'),
        );
      },
    );
  }

  Widget _buildFinishOrderButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderRequestedView()),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.lightGreenAccent, // Cor de fundo
      ),
      child: Text(
        'Finalizar Pedido',
        style: TextStyle(
          color: Colors.green, // Cor do texto
        ),
      ),
    );
  }
}