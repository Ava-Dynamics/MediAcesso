import 'package:flutter/material.dart';
import 'package:health_4_all/features/formElegibility/form_elegibility_model.dart';
import 'package:health_4_all/features/dataBase/databaseHelper.dart';
import 'package:validadores/Validador.dart';
import 'package:validadores/validadores.dart';

class FormElegibilityViewModel extends ChangeNotifier {
  final UserInfo _userInfo = UserInfo();
  String cpfValidationError = '';

  String removeSpecialCharacters(String cpf) {
  return cpf.replaceAll(RegExp(r'\D'), ''); // Remove todos os caracteres não numéricos
}

  void updateCpfValidation(String cpf) {
  // Remove caracteres especiais do CPF
  String cleanedCPF = removeSpecialCharacters(cpf);
  
  String? validationError = Validador()
    .add(Validar.CPF, msg: 'CPF Inválido')
    .add(Validar.OBRIGATORIO, msg: 'Campo obrigatório')
    .minLength(11)
    .maxLength(11)
    .valido(cleanedCPF, clearNoNumber: true);

  cpfValidationError = validationError ?? ''; // Se for nulo, atribui uma string vazia

}

  Future<void> saveFormData(UserInfo formData) async {
  try {
    print('Salvando dados no banco: $formData');
    // Chame o método na classe de helper do SQLite para salvar os dados.
    await DatabaseHelper.instance.insertFormData(formData);
    print('Dados salvos com sucesso!');
  } catch (e) {
    // Trate qualquer erro durante a operação de salvamento.
    print('Erro ao salvar dados no banco de dados: $e');
  }
}

  bool isFormValid() {
    return _userInfo.nomeCompleto.isNotEmpty &&
        _userInfo.numeroCpf.isNotEmpty &&
        _userInfo.email.isNotEmpty &&
        _userInfo.nomeRua.isNotEmpty &&
        _userInfo.numeroResidencial.isNotEmpty &&
        _userInfo.cidade.isNotEmpty &&
        _userInfo.estado.isNotEmpty &&
        cpfValidationError.isEmpty;
  }
  
  String get nomeCompleto => _userInfo.nomeCompleto;
  set nomeCompleto(String value) {
    _userInfo.nomeCompleto = value;
  }

  String get numeroCpf => _userInfo.numeroCpf;
  set numeroCpf(String value) {
    _userInfo.numeroCpf = value;
  }

  String get email => _userInfo.email;
  set email(String value) {
    _userInfo.email = value;
  }

  String get nomeRua => _userInfo.nomeRua;
  set nomeRua(String value) {
    _userInfo.nomeRua = value;
  }

  String get numeroResidencial => _userInfo.numeroResidencial;
  set numeroResidencial(String value) {
    _userInfo.numeroResidencial = value;
  }

  String get cidade => _userInfo.cidade;
  set cidade(String value) {
    _userInfo.cidade = value;
  }

  String get estado => _userInfo.estado;
  set estado(String value) {
    _userInfo.estado = value;
  }
}