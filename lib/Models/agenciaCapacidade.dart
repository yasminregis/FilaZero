import 'dart:convert';

class agenciaCapacidade {
  String? agenciaId;
  int? quantidadeFichas;
  String? horarioAbertura;
  String? horaraioFechamento;
  int? lotacao;

  agenciaCapacidade({
    this.agenciaId,
    this.quantidadeFichas,
    this.horarioAbertura,
    this.horaraioFechamento,
    this.lotacao,
  });

  factory agenciaCapacidade.fromJson(String str) =>
      agenciaCapacidade.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory agenciaCapacidade.fromMap(Map<String, dynamic> json) =>
      agenciaCapacidade(
        agenciaId: json["agenciaId"] == null ? null : json["agenciaId"],
        quantidadeFichas:
            json["quantidadeFichas"] == null ? null : json["quantidadeFichas"],
        horarioAbertura:
            json["horarioAbertura"] == null ? null : json["horarioAbertura"],
        horaraioFechamento: json["horaraioFechamento"] == null
            ? null
            : json["horaraioFechamento"],
        lotacao: json["lotacao"] == null ? null : json["lotacao"],
      );

  Map<String, dynamic> toMap() => {
        "agenciaId": agenciaId == null ? null : agenciaId,
        "quantidadeFichas": quantidadeFichas == null ? null : quantidadeFichas,
        "horarioAbertura": horarioAbertura == null ? null : horarioAbertura,
        "horaraioFechamento":
            horaraioFechamento == null ? null : horaraioFechamento,
        "lotacao": lotacao == null ? null : lotacao
      };
}
