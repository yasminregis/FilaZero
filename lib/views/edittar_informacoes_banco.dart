import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/agencia.dart';
import 'package:flutter_application_1/Models/agenciaCapacidade.dart';
import 'package:flutter_application_1/services/agenciaCapacidade_service.dart';

class EditarInformacoes extends StatelessWidget {
  final TextEditingController _fichaDisponibilizadas = TextEditingController();
  final TextEditingController _horarioAbertura = TextEditingController();
  final TextEditingController _horarioFechamento = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final agencia agenciaAtual = arguments?['agencia'] ?? '';
    final String agenciaNome = agenciaAtual.nomeBanco as String;
    final String agenciaId = agenciaAtual.key as String;
    // final Future<agenciaCapacidade> agenciaCapacidadeAtual =
    //     AgenciaCapacidadeService.getAgenciaCapacidade(agenciaId);

    void _cadastrarAgencia() {
      // Lógica para cadastrar a agência
      //String agenciaId = agenciaId;
      int capacidade = _fichaDisponibilizadas as int;
      String horarioAbertura = _horarioAbertura.text;
      String horarioFechamento = _horarioFechamento.text;

      agenciaCapacidade agenciaCad = agenciaCapacidade(
        agenciaId: agenciaId,
        quantidadeFichas: capacidade,
        horarioAbertura: horarioAbertura,
        horaraioFechamento: horarioFechamento,
      );

      // Faça algo com o código da agência (por exemplo, enviar para um servidor)

      AgenciaCapacidadeService.salvarAgenciaCapacidade(agenciaCad);
    }

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
                'Fichas disponibilizadas', 'Digite a quantidade de fichas',
                controller: _fichaDisponibilizadas),
            SizedBox(height: 16),
            _buildTextField(
                'Horário de abertura', 'Digite o horário de abertura',
                controller: _horarioAbertura),
            SizedBox(height: 16),
            _buildTextField(
                'Horário de fechamento', 'Digite o horário de fechamento',
                controller: _horarioFechamento),
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
