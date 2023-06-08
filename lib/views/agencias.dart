import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/agencia.dart';
import 'package:flutter_application_1/services/agencias_service.dart';

class Agencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
            ),
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
                  colors: [Colors.blue, Color.fromARGB(255, 229, 170, 7)],
                ),
              ),
              child: Text(
                'Meu perfil',
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
              title: Text('notificação'),
              onTap: () {
                // Lógica para ação da opção 2
              },
            ),
            ListTile(
              title: Text('Configuração'),
              onTap: () {
                // Lógica para ação da opção 1
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
        child: FutureBuilder<List<agencia>>(
          future: AgenciasService.buscarAgencias(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro ao carregar as agências'));
            } else {
              List<agencia> agencias = snapshot.data!;
              return ListView.builder(
                itemCount: agencias.length,
                itemBuilder: (context, index) {
                  agencia agenciaAtual = agencias[index];
                  return ListTile(
                    title: Text(agenciaAtual.nomeCompleto as String),
                    subtitle: Text(agenciaAtual.endereco as String),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
