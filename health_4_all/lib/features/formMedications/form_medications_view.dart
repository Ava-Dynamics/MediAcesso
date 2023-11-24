import 'package:flutter/material.dart';
import 'package:health_4_all/features/attachPage/attach_page_view.dart'; 
import 'package:health_4_all/features/attachPage/attach_page_model.dart';
import 'package:provider/provider.dart';
import 'package:health_4_all/features/attachPage/attach_page_view_model.dart';

class FormMedicationsView extends StatefulWidget {
  @override
  _FormMedicationsViewState createState() => _FormMedicationsViewState();
}

class _FormMedicationsViewState extends State<FormMedicationsView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _mobilityDifficultyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AttachPageViewModel(),
      child: Consumer<AttachPageViewModel>(
        builder: (context, model, _) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text('Envio de comprovantes'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Nos conte qual é a sua dificuldade de locomoção:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _mobilityDifficultyController,
                      decoration: InputDecoration(
                        hintText: 'Digite aqui...',
                      ),
                      onChanged: (value) {
                        model.updateMobilityDifficulty(value);
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Qual medicamento você necessita atualmente?',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildCheckbox(MedicationCategory.AntiHipertensivos, model),
                    _buildCheckbox(MedicationCategory.Antidiabeticos, model),
                    _buildCheckbox(MedicationCategory.Broncodilatadores, model),
                    _buildCheckbox(MedicationCategory.Geral, model),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        _sendForm(model);
                        _navigateToAttachPage(); // Chame a função para navegar para AttachPageView
                      },
                      child: const Text('Próximo Passo',
                      style: TextStyle(color: Colors.green)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCheckbox(MedicationCategory category, AttachPageViewModel model) {
    return Row(
      children: [
        Checkbox(
          value: model.model.selectedCategories.contains(category),
          onChanged: (value) {
            model.toggleCategory(category, value ?? false);
          },
        ),
        Text(category.toString().split('.').last),
      ],
    );
  }

  void _sendForm(AttachPageViewModel model) {
    final mobilityDifficulty = _mobilityDifficultyController.text;
    final selectedCategoriesText = model.model.selectedCategories.isNotEmpty
        ? model.model.selectedCategories.map((cat) => cat.toString().split('.').last).join(', ')
        : 'Nenhuma categoria selecionada';

    // Aqui você pode enviar ambas as informações para onde for necessário.
    print('Resposta da dificuldade de locomoção: $mobilityDifficulty');
    print('Categorias selecionadas: $selectedCategoriesText');

    // Lógica para o próximo passo
    print('Clicou no Próximo Passo');
  }

  void _submitForm(BuildContext context, AttachPageViewModel viewModel) async {
  bool dataSaved = await viewModel.saveFormData();
  
  if (dataSaved) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormMedicationsView()),
    );
  } else {
    _showErrorSnackBar('Erro ao salvar os dados.');
  }
}

  // Função para navegar para AttachPageView
  void _navigateToAttachPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AttachPageView(),
      ),
    );
  }

  void _showErrorSnackBar(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FormMedicationsView(),
  ));
}