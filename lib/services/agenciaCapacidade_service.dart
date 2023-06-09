import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/agenciaCapacidade.dart';
import 'package:http/http.dart' as http;

class AgenciaCapacidadeService {
  static const _baseUrl =
      'https://cod3r-firebase-teste-e4e7e-default-rtdb.firebaseio.com/';

  static void salvarAgenciaCapacidade(agenciaCapacidade agencia) async {
    final existe = await http.get(
        Uri.parse("$_baseUrl/agenciaCapacidade/${agencia.agenciaId}.json"));
    if (existe == null) {
      final response =
          await http.post(Uri.parse("$_baseUrl/agenciaCapacidade.json"),
              body: json.encode({
                "agenciaId": agencia.agenciaId,
                "quantidadeFichas": agencia.quantidadeFichas,
                "horarioAbertura": agencia.horarioAbertura,
                "horaraioFechamento": agencia.horaraioFechamento,
              }));
    }
  }

  static Future<agenciaCapacidade> getAgenciaCapacidade(
      String agenciaId) async {
    final response = await http
        .get(Uri.parse("$_baseUrl/agenciaCapacidade/${agenciaId}.json"));

    if (response.statusCode == 200) {
      // final data = json.decode(response.body);
      agenciaCapacidade agencia = agenciaCapacidade.fromJson(response.body);
      return agencia;
    } else {
      throw Exception('Falha ao buscar as agências');
    }
  }
}
