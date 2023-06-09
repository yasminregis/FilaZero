import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/agencia.dart';
import 'package:flutter_application_1/services/agencias_service.dart';

class Agencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/quem_somos_nos');

              // Lógica para ação de ajuda
            },
          ),
        ],
        title: Text('Agências'),
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
              title: Text('Configurações'),
              onTap: () {
                // Lógica para ação da opção 1
              },
            ),
            ListTile(
              title: Text('Notificações'),
              onTap: () {
                // Lógica para ação da opção 2
              },
            ),
            ListTile(
              title: Text('Sobre nós'),
              onTap: () {
                // Lógica para ação da opção 3
              },
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () {
                // Lógica para ação da opção 3
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Expanded(
              child: Container(
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
                      return Center(
                          child: Text('Erro ao carregar as agências'));
                    } else {
                      List<agencia> agencias = snapshot.data!;
                      return ListView.builder(
                        itemCount: agencias.length,
                        itemBuilder: (context, index) {
                          agencia agenciaAtual = agencias[index];
                          return Container(
                            margin: EdgeInsets.only(
                              top: 5.0,
                              bottom: 4.0,
                              left: 6.0,
                              right: 6.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color.fromARGB(255, 225, 139, 9),
                                width: 1.0,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    agenciaAtual.nomeBanco as String,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/detalhes_agencias',
                                        arguments: {
                                          'agencia': agenciaAtual,
                                          // passando a agência atual como argumento
                                        },
                                      );
                                      // Lógica para adicionar algo
                                    },
                                  ),
                                ],
                              ),
                              subtitle: Text(agenciaAtual.endereco as String),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
