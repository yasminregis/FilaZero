import 'package:flutter/material.dart';

class RecuperarSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esqueceu sua senha'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Informe seu email para recuperar a senha:',
              style:
                  TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Lógica para recuperar a senha
              },
              child: Text('RECUPERAR SENHA '),
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
}
