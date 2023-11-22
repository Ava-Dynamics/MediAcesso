import 'package:flutter/material.dart';
import 'package:health_4_all/myOrder/myOrder_view.dart';
import 'package:provider/provider.dart';
import 'package:health_4_all/features/mainHome/main_home_model.dart';
import 'package:health_4_all/features/mainHome/main_home_view_model.dart';

class MainHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainHomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('MediFarma Delivery'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Adicione a lógica para navegar para a tela de pedidos aqui
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyOrderView(itemName: 'exemplo',)),
                );
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            SizedBox(height: 16.0),
            _buildUBSList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Consumer<MainHomeViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24.0,
                // Adicione a lógica para exibir o ícone do perfil aqui
              ),
              SizedBox(width: 16.0),
              Text('Olá, ${viewModel.userName}'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUBSList() {
    return Consumer<MainHomeViewModel>(
      builder: (context, viewModel, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: viewModel.ubsList.length,
            itemBuilder: (context, index) {
              UBSModel ubs = viewModel.ubsList[index];
              return ListTile(
                leading: Icon(Icons.local_hospital),
                title: Text(ubs.name),
                subtitle: Text(ubs.location),
              );
            },
          ),
        );
      },
    );
  }
}