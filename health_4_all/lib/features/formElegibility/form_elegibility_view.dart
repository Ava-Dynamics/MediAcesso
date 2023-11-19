import 'package:flutter/material.dart';
import 'package:health_4_all/features/formElegibility/form_elegibility_view_model.dart';

class FormElegibilityView extends StatefulWidget {
  const FormElegibilityView({Key? key}) : super(key: key);

  @override
  _FormElegibilityViewState createState() => _FormElegibilityViewState();
}

class _FormElegibilityViewState extends State<FormElegibilityView> {
  final UserInfoViewModel viewModel = UserInfoViewModel();
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

  if (unformattedCPF.length <= 3) {
    _cpfController.text = unformattedCPF;
  } else if (unformattedCPF.length <= 6) {
    _cpfController.text = '${unformattedCPF.substring(0, 3)}.${unformattedCPF.substring(3)}';
  } else if (unformattedCPF.length <= 9) {
    _cpfController.text =
        '${unformattedCPF.substring(0, 3)}.${unformattedCPF.substring(3, 6)}.${unformattedCPF.substring(6)}';
  } else {
    _cpfController.text =
        '${unformattedCPF.substring(0, 3)}.${unformattedCPF.substring(3, 6)}.${unformattedCPF.substring(6, 9)}-${unformattedCPF.substring(9)}';
  }

  // Certifique-se de que a seleção não ultrapasse o comprimento atual do texto
  int newCursorPosition = _cpfController.text.length;
  _cpfController.selection = TextSelection.fromPosition(TextPosition(offset: newCursorPosition));
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
              _buildTextFieldWithLabel('Nome completo', 'Informe o valor', TextEditingController()),
              _buildTextFieldWithLabel('Número do CPF', 'Informe o valor', _cpfController, onChanged: (value) {
                viewModel.numeroCpf = value;
                viewModel.updateCpfValidation(value);
              }),
              _buildTextFieldWithLabel('Nome da rua', 'Informe o valor', TextEditingController()),
              _buildTextFieldWithLabel('Número residencial', 'Informe o valor', TextEditingController()),
              _buildTextFieldWithLabel('Cidade', 'Informe o valor', TextEditingController()),
              _buildTextFieldWithLabel('Estado', 'Informe o valor', TextEditingController()),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Lógica para processar os dados do formulário
                  _submitForm();
                },
                child: const Text('Proximo Passo'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    // Exemplo: Exibir mensagem de erro se o CPF for inválido
    String cpfValidationError = viewModel.isValidCPF(_cpfController.text);
    if (cpfValidationError.isNotEmpty) {
      // Exibir SnackBar com a mensagem de erro
      _showErrorSnackBar(cpfValidationError);
    }
  }

  void _showErrorSnackBar(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildTextFieldWithLabel(String label, String hint, TextEditingController controller, {ValueChanged<String>? onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
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
}