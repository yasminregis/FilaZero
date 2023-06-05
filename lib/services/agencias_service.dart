import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgenciasService {
  static const _baseUrl =
      'https://cod3r-firebase-teste-e4e7e-default-rtdb.firebaseio.com/';

  static void salvarAgencia(
      String nome_do_banco,
      String agencia,
      String endereco,
      int capacidade_de_atendimento,
      TimeOfDay? hora_abertura,
      TimeOfDay? hora_fechamento,
      BuildContext context) async {
    String horario_abertura =
        hora_abertura != null ? hora_abertura.format(context) : '';

    String horario_fechamento =
        hora_fechamento != null ? hora_fechamento.format(context) : '';

    final response = await http.post(Uri.parse("$_baseUrl/agencias.json"),
        body: json.encode({
          "nome_do_banco": nome_do_banco,
          "agencia": agencia,
          "endereco": endereco,
          "capacidade_de_atendimento": capacidade_de_atendimento,
          "hora_abertura": horario_abertura,
          "hora_fechamento": horario_fechamento,
        }));
  }

  static void buscarAgecias() async {
    final response = await http.get(Uri.parse("$_baseUrl/agencias.json"));
  }
}
