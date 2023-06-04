import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        ),
      ),
    );
  }
}
