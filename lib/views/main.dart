import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/agencias.dart';
import 'package:flutter_application_1/views/agencias_adm.dart';
import 'package:flutter_application_1/views/ajuda.dart';
import 'package:flutter_application_1/views/recuperar_senha.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:flutter_application_1/views/inicial.dart';
import 'package:flutter_application_1/views/cadastrar_banco.dart';
import 'package:flutter_application_1/views/login_adm.dart';
import 'package:flutter_application_1/views/cadastrar_cliente.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaInicial(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginPage(),
        '/recuperar_senha': (context) => RecuperarSenha(),
        '/inicial': (context) => TelaInicial(),
        '/cadastrar_banco': (context) => CadastarBanco(),
        '/agencias': (context) => Agencias(),
        "/login_adm": (context) => LoginAdm(),
        "/agencias_adm": (context) => AgenciasAdm(),
        "/ajuda": (context) => Ajuda(),
        "/cadastrar_cliente": (context) => CadastrarCliente(),
      },
    );
  }
}
