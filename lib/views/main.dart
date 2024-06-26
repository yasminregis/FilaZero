import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/agencias.dart';
import 'package:flutter_application_1/views/agencias_adm.dart';
import 'package:flutter_application_1/views/quem_comos_nos.dart';
import 'package:flutter_application_1/views/edittar_informacoes_banco.dart';
import 'package:flutter_application_1/views/recuperar_senha.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:flutter_application_1/views/inicial.dart';
import 'package:flutter_application_1/views/cadastrar_banco.dart';
import 'package:flutter_application_1/views/login_adm.dart';
import 'package:flutter_application_1/views/cadastrar_cliente.dart';
import 'package:flutter_application_1/views/detalhes_agencia.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: TelaInicial(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginPage(),
        '/recuperar_senha': (context) => RecuperarSenha(),
        '/inicial': (context) => TelaInicial(),
        '/cadastrar_banco': (context) => CadastrarBanco(),
        '/agencias': (context) => Agencias(),
        "/login_adm": (context) => LoginAdm(),
        "/agencias_adm": (context) => AgenciasAdm(),
        "/quem_somos_nos": (context) => QuemSomosNos(),
        "/cadastrar_cliente": (context) => CadastrarCliente(),
        "/editar_informacoes_banco": (context) => EditarInformacoes(),
        '/detalhes_agencias': (context) => DetalhesAgencia(),
      },
    );
  }
}
