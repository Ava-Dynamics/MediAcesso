import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_4_all/features/myOrder/myOrder_view_model.dart';
import 'package:health_4_all/features/myOrder/myOrder_model.dart';

class MyOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyOrderViewModel(),
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
            _buildSelectedItemsList(context, viewModel),
            SizedBox(height: 16.0),
            _buildFinishOrderButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedItemsList(BuildContext context, MyOrderViewModel viewModel) {
  List<OrderItem> orderItems = viewModel.selectedItems ?? [];

  return ListView.builder(
    shrinkWrap: true,
    itemCount: orderItems.length,
    itemBuilder: (context, index) {
      OrderItem orderItem = orderItems[index];
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
        // Adicione a lógica para finalizar o pedido aqui
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