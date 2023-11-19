import 'package:health_4_all/features/formElegibility/form_elegibility_model.dart';

class UserInfoViewModel {
  UserInfo _userInfo = UserInfo();

  String get nomeCompleto => _userInfo.nomeCompleto;
  set nomeCompleto(String value) {
    _userInfo.nomeCompleto = value;
  }

  String get numeroCpf => _userInfo.numeroCpf;
  set numeroCpf(String value) {
    // Validar e armazenar o CPF apenas se for válido
    String validationError = isValidCPF(value);
    if (validationError.isEmpty) {
      _userInfo.numeroCpf = value;
    } else {
      // Lidar com o erro, por exemplo, lançando uma exceção, exibindo uma mensagem, etc.
      print(validationError);
    }
  }

  String _cpfValidationError = '';

  String get cpfValidationError => _cpfValidationError;

  void updateCpfValidation(String cpf) {
    // Atualiza a validação do CPF em tempo real
    _cpfValidationError = isValidCPF(cpf);
  }

  String isValidCPF([String? cpf]) {
  // Remover caracteres não numéricos
  cpf = cpf ?? _userInfo.numeroCpf;
  cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');

  // Verificar se o CPF tem 11 dígitos
  if (cpf.length != 11) {
    return 'CPF deve ter 11 dígitos';
  }

  // Verificar se todos os dígitos são iguais (situação inválida)
  if (RegExp(r'(\d)\1{10}').hasMatch(cpf)) {
    return 'CPF inválido (todos os dígitos iguais)';
  }

  // Calcular os dígitos verificadores
  List<int> cpfDigits = cpf.split('').map((e) => int.parse(e)).toList();
  int firstVerifier = _calculateVerifier(cpfDigits.sublist(0, 9), cpfDigits[9]);
  int secondVerifier = _calculateVerifier(cpfDigits.sublist(0, 10), cpfDigits[10]);

  // Verificar se os dígitos verificadores são iguais aos fornecidos
  if (cpfDigits[9] != firstVerifier || cpfDigits[10] != secondVerifier) {
    return 'CPF inválido (dígitos verificadores incorretos)';
  }

  // CPF é válido
  return '';
  }

  int _calculateVerifier(List<int> cpfDigits, int verifier) {
    int sum = cpfDigits.fold(0, (acc, digit) => acc + digit);

    int remainder = sum % 11;
    int calculatedVerifier = (remainder < 2) ? 0 : (11 - remainder);

    return calculatedVerifier;
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
