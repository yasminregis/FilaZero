import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/agencia.dart';
import 'package:http/http.dart' as http;

class AgenciasService {
  static const _baseUrl =
      'https://cod3r-firebase-teste-e4e7e-default-rtdb.firebaseio.com/';

  static void salvarAgencia(agencia novaAgencia) async {
    final response = await http.post(Uri.parse("$_baseUrl/agencias.json"),
        body: json.encode({
          "nome_completo": novaAgencia.nomeCompleto,
          "cnpj": novaAgencia.cnpj,
          "endereco": novaAgencia.endereco,
          "senha": novaAgencia.senha,
          "nomeBanco": novaAgencia.nomeBanco,
          "codigoAgencia": novaAgencia.codigoAgencia
        }));
  }

  static Future<List<agencia>> buscarAgencias() async {
    final response = await http.get(Uri.parse("$_baseUrl/agencias.json"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<agencia> agencias = [];

      data.forEach((key, value) {
        agencia agenciaAtual = agencia(
          nomeCompleto: value['nome_completo'],
          cnpj: value['cnpj'],
          endereco: value['endereco'],
          senha: value['senha'],
          nomeBanco: value['nomeBanco'],
          codigoAgencia: value['codigoAgencia'],
          key: key,
        );
        agencias.add(agenciaAtual);
      });

      return agencias;
    } else {
      throw Exception('Falha ao buscar as agências');
    }
  }
}
