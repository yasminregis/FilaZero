import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Models/agencia.dart';
import 'package:flutter_application_1/services/agencias_service.dart';

class CadastrarBanco extends StatelessWidget {
  final TextEditingController _agenciaController = TextEditingController();
  final TextEditingController _cnpjController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _nomeBancoontroller = TextEditingController();
  final TextEditingController _nomeCompletoontroller = TextEditingController();
  final TextEditingController _codigoAgenciaController =
      TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmaSenhaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _cadastrarAgencia() {
      // Lógica para cadastrar a agência
      String nomeCompleto = _nomeCompletoontroller.text;
      String cnpj = _cnpjController.text;
      String endereco = _enderecoController.text;
      String senha = _senhaController.text;
      String nomeBanco = _nomeBancoontroller.text;
      String codigoAgencia = _codigoAgenciaController.text;
      String confSenha = _confirmaSenhaController.text;

      agencia novoAgencia = agencia(
          nomeCompleto: nomeCompleto,
          cnpj: cnpj,
          endereco: endereco,
          senha: senha,
          nomeBanco: nomeBanco,
          codigoAgencia: codigoAgencia);

      if (senha != confSenha) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Senhas informadas são diferentes')),
        );
        return;
      }
      // Faça algo com o código da agência (por exemplo, enviar para um servidor)

      AgenciasService.salvarAgencia(novoAgencia);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Cadastre seu Banco'),
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
            _buildTextField('Nome completo', 'Digite seu nome completo',
                controller: _nomeCompletoontroller),
            SizedBox(height: 16),
            _buildTextField('CNPJ', 'Digite o CNPJ',
                controller: _cnpjController),
            SizedBox(height: 16),
            _buildTextField('Endereço', 'Digite o endereço',
                controller: _enderecoController),
            SizedBox(height: 16),
            _buildTextField('Senha', 'Digite sua senha',
                isPassword: true, controller: _senhaController),
            SizedBox(height: 16),
            _buildTextField('Nome do Banco', 'Digite o nome do banco',
                controller: _nomeBancoontroller),
            SizedBox(height: 16),
            _buildTextField('Código da Agência', 'Digite o código da agência',
                controller: _codigoAgenciaController),
            SizedBox(height: 16),
            _buildTextField('Confirmação de Senha', 'Confirme sua senha',
                isPassword: true, controller: _confirmaSenhaController),
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
              onPressed: _cadastrarAgencia,
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
              child: Text('CADASTRAR'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint,
      {bool isPassword = false, TextEditingController? controller}) {
    return TextField(
      controller: controller,
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
