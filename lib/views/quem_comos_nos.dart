import 'package:flutter/material.dart';

class QuemSomosNos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quem somos nós?'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 21, 123, 207)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Texto no canto superior esquerdo
            Text(
              'FilaZero',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Seja bem-vindo(a)!',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            // Ícone de telefone e número
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                SizedBox(width: 8.0),
                Text(
                  '+55 123456789',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Ícones do Facebook
          ],
        ),
      ),
    );
  }
}
