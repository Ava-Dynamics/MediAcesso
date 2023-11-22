import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_4_all/features/detailsUBSItems/detailsUBSItems_view.dart';
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
          actions: [],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            SizedBox(height: 16.0),
            _buildUBSList(context),
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

  Widget _buildUBSList(BuildContext context) {
    return Consumer<MainHomeViewModel>(
      builder: (context, viewModel, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: viewModel.ubsList.length,
            itemBuilder: (context, index) {
              UBSModel ubs = viewModel.ubsList[index];
              return GestureDetector(
                onTap: () {
                  // Adicione a lógica para navegar para a tela de detalhes da UBS aqui
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UBSItemView(ubs: ubs),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.local_hospital),
                  title: Text(ubs.name),
                  subtitle: Text(ubs.location),
                ),
              );
            },
          ),
        );
      },
    );
  }
}