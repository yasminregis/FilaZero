import 'package:flutter/material.dart';

class CadastrarCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de usuário'),
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
            _buildTextField('Nome completo', 'Digite seu nome completo'),
            SizedBox(height: 16),
            _buildTextField('Email', 'Digite seu email'),
            SizedBox(height: 16),
            _buildTextField(
                'Data de Nascimento', 'Digite sua data de nascimento'),
            SizedBox(height: 16),
            _buildTextField('Senha', 'Digite sua senha', isPassword: true),
            SizedBox(height: 16),
            _buildTextField('Confirmação de Senha', 'Confirme sua senha',
                isPassword: true),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {
                    // Lógica para aceitar os termos e condições
                  },
                ),
                Text('Aceitar termos e condições'),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Lógica para cadastrar o usuário
              },
              child: Text('CADASTRAR'),
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
