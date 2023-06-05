import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
=======
import 'package:flutter/services.dart';
>>>>>>> bc9872357b9cb7e7d57be7b14b020743c0bdb77f

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'Seu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminScreen(
        BankInfo(
          'Nome do Banco',
          'Endereço do Banco',
          'Agência do Banco',
          100,
          false,
          50,
          30,
          10,
          true,
        ),
      ),
=======
      title: 'My App',
      home: CadastroScreen(),
>>>>>>> bc9872357b9cb7e7d57be7b14b020743c0bdb77f
    );
  }
}

<<<<<<< HEAD
class BankInfo {
  String name;
  String address;
  String agency;
  int capacidadeAtendimento;
  bool isFull;
  double percentageLotado;
  double percentageModerado;
  double percentageDisponivel;
  bool isOpen;

  BankInfo(
    this.name,
    this.address,
    this.agency,
    this.capacidadeAtendimento,
    this.isFull,
    this.percentageLotado,
    this.percentageModerado,
    this.percentageDisponivel,
    this.isOpen,
  );
}

class AdminScreen extends StatefulWidget {
  final BankInfo bankInfo;

  AdminScreen(this.bankInfo);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController agencyController = TextEditingController();
  TextEditingController capacityController = TextEditingController();
  bool isFull = false;
  TimeOfDay openingTime = TimeOfDay.now();
  TimeOfDay closingTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.bankInfo.name;
    addressController.text = widget.bankInfo.address;
    agencyController.text = widget.bankInfo.agency;
    capacityController.text = widget.bankInfo.capacidadeAtendimento.toString();
    isFull = widget.bankInfo.isFull;
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    agencyController.dispose();
    capacityController.dispose();
    super.dispose();
  }

  void saveChanges() {
    final updatedBankInfo = BankInfo(
      nameController.text,
      addressController.text,
      agencyController.text,
      int.parse(capacityController.text),
      isFull,
      widget.bankInfo.percentageLotado,
      widget.bankInfo.percentageModerado,
      widget.bankInfo.percentageDisponivel,
      widget.bankInfo.isOpen,
    );

    print(updatedBankInfo);

    Navigator.pop(context);
  }

  Future<void> selectOpeningTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: openingTime,
    );

    if (pickedTime != null && pickedTime != openingTime) {
      setState(() {
        openingTime = pickedTime;
      });
    }
  }

  Future<void> selectClosingTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: closingTime,
    );

    if (pickedTime != null && pickedTime != closingTime) {
      setState(() {
        closingTime = pickedTime;
      });
    }
=======
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
>>>>>>> bc9872357b9cb7e7d57be7b14b020743c0bdb77f
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text('EDITAR INFORMAÇÕES'),
        backgroundColor: Color(0xFF02337C),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16.0),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nome do Banco',
              ),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Endereço do Banco',
              ),
            ),
            TextField(
              controller: agencyController,
              decoration: InputDecoration(
                labelText: 'Agência do Banco',
              ),
            ),
            TextField(
              controller: capacityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Capacidade de Atendimento',
              ),
            ),
            SizedBox(height: 30.0),
            ListTile(
              title: Text('Hora de Abertura'),
              trailing: Text(openingTime.format(context)),
              onTap: selectOpeningTime,
            ),
            ListTile(
              title: Text('Hora de Fechamento'),
              trailing: Text(closingTime.format(context)),
              onTap: selectClosingTime,
            ),
            SizedBox(height: 35.0),
            ElevatedButton(
              onPressed: saveChanges,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 18),
                primary: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              child: Text(
                'SALVAR',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
=======
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
>>>>>>> bc9872357b9cb7e7d57be7b14b020743c0bdb77f
        ),
      ),
    );
  }
<<<<<<< HEAD
=======

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
>>>>>>> bc9872357b9cb7e7d57be7b14b020743c0bdb77f
}
