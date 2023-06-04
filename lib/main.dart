import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: CadastroScreen(),
    );
  }
}

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _nomeBancoController = TextEditingController();
  final _agenciaController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _capacidadeAtendimentoController = TextEditingController();
  TimeOfDay? _horaAbertura;
  TimeOfDay? _horaFechamento;

  void _cadastrar() {
    // Lógica para cadastrar o banco
    String nomeBanco = _nomeBancoController.text.trim();
    String agencia = _agenciaController.text.trim();
    String endereco = _enderecoController.text.trim();
    String capacidadeAtendimento = _capacidadeAtendimentoController.text.trim();

    // Validar os campos

    // Validar o nome do banco
    if (nomeBanco.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Digite o nome do banco')),
      );
      return;
    }

    // Validar a agência (somente números)
    RegExp regex = RegExp(r'^\d+$');
    if (!regex.hasMatch(agencia)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('A agência deve conter apenas números')),
      );
      return;
    }

    // Validar o endereço
    if (endereco.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Digite o endereço')),
      );
      return;
    }

    // Validar a capacidade máxima
    int? capacidade = int.tryParse(capacidadeAtendimento);
    if (capacidade == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Digite uma capacidade de atendimento válida')),
      );
      return;
    }

    // Validar a hora de abertura
    if (_horaAbertura == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selecione a hora de abertura')),
      );
      return;
    }

    // Validar a hora de fechamento
    if (_horaFechamento == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selecione a hora de fechamento')),
      );
      return;
    }

    // Restante da lógica para cadastrar o banco
    // ...

    // Exemplo de impressão dos valores no console
    print('Nome do banco: $nomeBanco');
    print('Agência: $agencia');
    print('Endereço: $endereco');
    print('Capacidade de atendimento: $capacidade');
    print('Hora de abertura: $_horaAbertura');
    print('Hora de fechamento: $_horaFechamento');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff02337C),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'CADASTRO DE BANCO',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(width: 40.0),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField(
                    label: 'Nome do banco:',
                    controller: _nomeBancoController,
                    hintText: 'Insira o nome do banco',
                  ),
                  SizedBox(height: 16.0),
                  _buildTextField(
                    label: 'Agência:',
                    controller: _agenciaController,
                    hintText: 'Insira a agência',
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(height: 16.0),
                  _buildTextField(
                    label: 'Endereço:',
                    controller: _enderecoController,
                    hintText: 'Insira o endereço',
                  ),
                  SizedBox(height: 16.0),
                  _buildTextField(
                    label: 'Capacidade de atendimento:',
                    controller: _capacidadeAtendimentoController,
                    hintText: 'Insira a capacidade de atendimento',
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(height: 16.0),
                  _buildTimePicker(
                    label: 'Hora de abertura:',
                    selectedTime: _horaAbertura,
                    onTimeSelected: (time) {
                      setState(() {
                        _horaAbertura = time;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  _buildTimePicker(
                    label: 'Hora de fechamento:',
                    selectedTime: _horaFechamento,
                    onTimeSelected: (time) {
                      setState(() {
                        _horaFechamento = time;
                      });
                    },
                  ),
                  SizedBox(height: 24.0),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _cadastrar,
                      child: Text(
                        'CADASTRAR',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    List<TextInputFormatter>? inputFormatter,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 9.0),
        TextField(
          controller: controller,
          inputFormatters: inputFormatter,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimePicker({
    required String label,
    required TimeOfDay? selectedTime,
    required Function(TimeOfDay) onTimeSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 9.0),
        ElevatedButton(
          onPressed: () {
            _showTimePicker(selectedTime, onTimeSelected);
          },
          child: Text(
            selectedTime != null
                ? '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}'
                : 'Selecionar',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xffe78c04),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showTimePicker(
    TimeOfDay? selectedTime,
    Function(TimeOfDay) onTimeSelected,
  ) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      onTimeSelected(pickedTime);
    }
  }
}
