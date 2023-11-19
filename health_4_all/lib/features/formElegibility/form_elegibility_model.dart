class UserInfo {
  String _nomeCompleto = '';
  String _numeroCpf = '';
  String nomeRua = '';
  String numeroResidencial = '';
  String cidade = '';
  String estado = '';

  String get nomeCompleto => _nomeCompleto;
  set nomeCompleto(String value) {
    _nomeCompleto = value;
  }

  String get numeroCpf => _numeroCpf;
  set numeroCpf(String value) {
    _numeroCpf = value;
  }
}