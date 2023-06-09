import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/agenciaCapacidade.dart';
import 'package:http/http.dart' as http;

class AgenciaCapacidadeService {
  static const _baseUrl =
      'https://cod3r-firebase-teste-e4e7e-default-rtdb.firebaseio.com/';

  static void salvarAgenciaCapacidade(agenciaCapacidade agencia) async {
    final existeResposta =
        await http.get(Uri.parse("$_baseUrl/agenciaCapacidade.json"));

    final Map<String, dynamic> data = json.decode(existeResposta.body);
    bool existe = false;

    data.forEach((key, value) async {
      if (value['agenciaId'] == agencia.agenciaId) {
        final updateItem = await http.patch(
            Uri.parse("$_baseUrl/agenciaCapacidade/$key.json"),
            body: agencia.toJson());
        existe = true;
      }
    });

    if (existe == false) {
      final response =
          await http.post(Uri.parse("$_baseUrl/agenciaCapacidade.json"),
              body: json.encode({
                "agenciaId": agencia.agenciaId,
                "quantidadeFichas": agencia.quantidadeFichas,
                "horarioAbertura": agencia.horarioAbertura,
                "horaraioFechamento": agencia.horaraioFechamento,
                "lotacao": agencia.lotacao,
              }));
    }
  }

  static Future<agenciaCapacidade> getAgenciaCapacidade(
      String agenciaId) async {
    final response =
        await http.get(Uri.parse("$_baseUrl/agenciaCapacidade.json"));

    if (response.statusCode == 200) {
      // final data = json.decode(response.body);
      agenciaCapacidade agencia = agenciaCapacidade.fromJson(response.body);
      return agencia;
    } else {
      throw Exception('Falha ao buscar as agências');
    }
  }
}
