import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgenciasService {
  static const _baseUrl =
      'https://cod3r-firebase-teste-e4e7e-default-rtdb.firebaseio.com/';

  static void salvarAgencia(
      String nomeCompleto,
      String cnpj,
      String endereco,
      String codigoAgencia,
      String senha,
      String nomeBanco,
      String codAgencia) async {
    final response = await http.post(Uri.parse("$_baseUrl/agencias.json"),
        body: json.encode({
          "nome_completo": nomeCompleto,
          "cnpj": cnpj,
          "endereco": endereco,
          "codigoAgencia": codigoAgencia,
          "senha": senha,
          "nomeBanco": nomeBanco,
          "codAgencia": codAgencia
        }));
  }

  static void buscarAgecias() async {
    final response = await http.get(Uri.parse("$_baseUrl/agencias.json"));
  }
}
