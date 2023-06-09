import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/agencia.dart';
import 'package:flutter_application_1/Models/agenciaCapacidade.dart';
import 'package:flutter_application_1/services/agenciaCapacidade_service.dart';

class DetalhesAgencia extends StatelessWidget {
  final TextEditingController _fichaDisponibilizadas = TextEditingController();
  final TextEditingController _horarioAbertura = TextEditingController();
  final TextEditingController _horarioFechamento = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final agencia agenciaAtual = arguments?['agencia'] ?? '';

    final String agenciaNome = agenciaAtual.nomeBanco as String;
    final String horarioAbertura = agenciaAtual.codigoAgencia as String;
    final String agenciaId = agenciaAtual.key as String;
    //final Future<agenciaCapacidade> agenciaCapacidadeAtual =
    // AgenciaCapacidadeService.getAgenciaCapacidade(agenciaId);

    void _cadastrarAgencia() {
      // Lógica para cadastrar a agência
      //String agenciaId = agenciaId;
      int capacidade = int.tryParse(_fichaDisponibilizadas.text) ?? 0;
      print(capacidade);
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
        title: Text('Detalhes da agência'),
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
            Text(
              'Horário abertura: $agenciaAtual. ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
