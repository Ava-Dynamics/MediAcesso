import 'package:flutter/material.dart';
import 'package:health_4_all/features/formElegibility/form_elegibility_model.dart';
import 'package:health_4_all/features/formMedications/form_medications_view.dart';
import 'package:health_4_all/features/formElegibility/form_elegibility_view_model.dart';

class FormElegibilityView extends StatefulWidget {
  const FormElegibilityView({Key? key}) : super(key: key);

  @override
  _FormElegibilityViewState createState() => _FormElegibilityViewState();
}

class _FormElegibilityViewState extends State<FormElegibilityView> {
  final FormElegibilityViewModel viewModel = FormElegibilityViewModel();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _cpfController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cpfController.addListener(_formatCPF);
  }

  @override
  void dispose() {
    _cpfController.dispose();
    super.dispose();
  }

  void _formatCPF() {
    String unformattedCPF = _cpfController.text.replaceAll(RegExp(r'\D'), '');

    viewModel.numeroCpf = unformattedCPF;
    viewModel.updateCpfValidation(unformattedCPF);

    int newCursorPosition = _cpfController.text.length;
    _cpfController.value = _cpfController.value.copyWith(
      text: _formattedCPF(unformattedCPF),
      selection: TextSelection.fromPosition(TextPosition(offset: newCursorPosition)),
    );
  }

  String _formattedCPF(String unformattedCPF) {
    if (unformattedCPF.length <= 3) {
      return unformattedCPF;
    } else if (unformattedCPF.length <= 6) {
      return '${unformattedCPF.substring(0, 3)}.${unformattedCPF.substring(3)}';
    } else if (unformattedCPF.length <= 9) {
      return '${unformattedCPF.substring(0, 3)}.${unformattedCPF.substring(3, 6)}.${unformattedCPF.substring(6)}';
    } else {
      return '${unformattedCPF.substring(0, 3)}.${unformattedCPF.substring(3, 6)}.${unformattedCPF.substring(6, 9)}-${unformattedCPF.substring(9)}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Formulário de Elegibilidade'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Para ser analisada sua elegibilidade, preencha os seguintes campos:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              _buildTextFieldWithLabel('Nome completo', 'Informe o nome completo', TextEditingController(), onChanged: (value) {
                viewModel.nomeCompleto = value;
              }),
              _buildCPFTextField(),
              _buildTextFieldWithLabel('E-mail', 'Ex: exemplo@gmail.com', TextEditingController(), onChanged: (value) {
                viewModel.nomeCompleto = value;
              }),
              _buildTextFieldWithLabel('Nome da rua', 'Ex: Rua/Avenida', TextEditingController(), onChanged: (value) {
                viewModel.nomeRua = value;
              }),
              _buildTextFieldWithLabel('Número residencial', 'Ex: 58', TextEditingController(), onChanged: (value) {
                viewModel.numeroResidencial = value;
              }),
              _buildTextFieldWithLabel('Cidade', 'Ex: Ataléia', TextEditingController(), onChanged: (value) {
                viewModel.cidade = value;
              }),
              _buildTextFieldWithLabel('Estado', 'Ex: SP/MG', TextEditingController(), onChanged: (value) {
                viewModel.estado = value;
              }),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _submitForm(context);
                },
                child: const Text('Próximo Passo',
                style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel(String label, String hint, TextEditingController controller, {ValueChanged<String>? onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildCPFTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Número do CPF',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: _cpfController,
          onChanged: (value) {
            viewModel.numeroCpf = value;
            viewModel.updateCpfValidation(value);
          },
          decoration: InputDecoration(
            hintText: 'Ex: 123.456.789-00',
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  void _submitForm(BuildContext context) async {
  UserInfo formData = UserInfo(
    nomeCompleto: viewModel.nomeCompleto,
    numeroCpf: viewModel.numeroCpf,
    email: viewModel.email,
    nomeRua: viewModel.nomeRua,
    numeroResidencial: viewModel.numeroResidencial,
    cidade: viewModel.cidade,
    estado: viewModel.estado,
  );

  await _saveFormDataToDatabase(formData);

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FormMedicationsView()),
  );
}

Future<void> _saveFormDataToDatabase(UserInfo formData) async {
  // Chame um método na sua classe de helper para salvar os dados no SQLite.
  // Por exemplo, você pode criar um método em FormElegibilityViewModel que chama
  // um método na classe de helper do SQLite para salvar os dados.
  await viewModel.saveFormData(formData);
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