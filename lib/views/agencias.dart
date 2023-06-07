import 'package:flutter/material.dart';

class Agencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Lógica para ação de favorito
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue,
                    const Color.fromARGB(255, 175, 144, 76)
                  ],
                ),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text('Ajuda'),
              onTap: () {
                // Lógica para ação da opção 1
              },
            ),
            ListTile(
              title: Text('Notificação'),
              onTap: () {
                // Lógica para ação da opção 2
              },
            ),
            ListTile(
              title: Text('Configurações'),
              onTap: () {
                // Lógica para ação da opção 2
              },
            ),
          ],
        ),
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
        child: ListView(
          children: [
            ListTile(
              title: Text('Conteúdo 1'),
            ),
            ListTile(
              title: Text('Conteúdo 2'),
            ),
            ListTile(
              title: Text('Conteúdo 3'),
            ),
          ],
        ),
      ),
    );
  }
}
