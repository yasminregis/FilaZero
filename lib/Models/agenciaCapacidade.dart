import 'dart:convert';

class agenciaCapacidade {
  String? agenciaId;
  int? quantidadeFichas;
  String? horarioAbertura;
  String? horaraioFechamento;

  agenciaCapacidade({
    this.agenciaId,
    this.quantidadeFichas,
    this.horarioAbertura,
    this.horaraioFechamento,
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
      );

  Map<String, dynamic> toMap() => {
        "agenciaId": agenciaId == null ? null : agenciaId,
        "quantidadeFichas": quantidadeFichas == null ? null : quantidadeFichas,
        "horarioAbertura": horarioAbertura == null ? null : horarioAbertura,
        "horaraioFechamento":
            horaraioFechamento == null ? null : horaraioFechamento,
      };
}
