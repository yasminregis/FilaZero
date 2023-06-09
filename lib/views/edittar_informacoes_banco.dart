import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/agencia.dart';

class EditarInformacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final agencia agenciaAtual = arguments?['agencia'] ?? '';
    final String agenciaNome = agenciaAtual.nomeBanco as String;
    final String agenciaId = agenciaAtual.key as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Informações de Atendimento'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 21, 123, 207)
            ],
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Agência: $agenciaNome ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            _buildTextField(
                'Fichas disponibilizadas', 'Digite a quantidade de fichas'),
            SizedBox(height: 16),
            _buildTextField(
                'Horário de abertura', 'Digite o horário de abertura'),
            SizedBox(height: 16),
            _buildTextField(
                'Horário de fechamento', 'Digite o horário de fechamento'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Lógica para cadastrar o usuário
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 225, 139, 9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
              ),
              child: Text('ENVIAR'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
