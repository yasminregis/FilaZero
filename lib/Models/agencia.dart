import 'dart:convert';

class agencia {
  String? nomeCompleto;
  String? cnpj;
  String? endereco;
  String? senha;
  String? nomeBanco;
  String? codigoAgencia;

  agencia({
    this.nomeCompleto,
    this.cnpj,
    this.endereco,
    this.senha,
    this.nomeBanco,
    this.codigoAgencia,
  });

  factory agencia.fromJson(String str) => agencia.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory agencia.fromMap(Map<String, dynamic> json) => agencia(
        nomeCompleto:
            json["nome_completo"] == null ? null : json["nome_completo"],
        cnpj: json["cnpj"] == null ? null : json["cnpj"],
        endereco: json["endereco"] == null ? null : json["endereco"],
        senha: json["senha"] == null ? null : json["senha"],
        nomeBanco: json["nomeBanco"] == null ? null : json["nomeBanco"],
        codigoAgencia:
            json["codigoAgencia"] == null ? null : json["codigoAgencia"],
      );

  Map<String, dynamic> toMap() => {
        "nome_completo": nomeCompleto == null ? null : nomeCompleto,
        "cnpj": cnpj == null ? null : cnpj,
        "endereco": endereco == null ? null : endereco,
        "senha": senha == null ? null : senha,
        "nomeBanco": nomeBanco == null ? null : nomeBanco,
        "codigoAgencia": codigoAgencia == null ? null : codigoAgencia,
      };
}
