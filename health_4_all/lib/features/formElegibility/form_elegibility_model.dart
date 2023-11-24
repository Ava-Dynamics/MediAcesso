class UserInfo {
  int? id;
  String nomeCompleto = '';
  String numeroCpf = '';
  String email = '';
  String nomeRua = '';
  String numeroResidencial = '';
  String cidade = '';
  String estado = '';

  UserInfo({
    this.id,
    this.nomeCompleto = '',
    this.numeroCpf = '',
    this.email = '',
    this.nomeRua = '',
    this.numeroResidencial = '',
    this.cidade = '',
    this.estado = '',
  });

  factory UserInfo.fromMap(Map<String, dynamic> map) => UserInfo(
        id: map['id'] as int?,
        nomeCompleto: map['nomeCompleto'] as String,
        numeroCpf: map['numeroCpf'] as String,
        email: map['email'] as String,
        nomeRua: map['nomeRua'] as String,
        numeroResidencial: map['numeroResidencial'] as String,
        cidade: map['cidade'] as String,
        estado: map['estado'] as String,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'nomeCompleto': nomeCompleto,
        'numeroCpf': numeroCpf,
        'email': email,
        'nomeRua': nomeRua,
        'numeroResidencial': numeroResidencial,
        'cidade': cidade,
        'estado': estado,
      };
}