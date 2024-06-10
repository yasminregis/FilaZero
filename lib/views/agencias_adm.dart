import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/agencia.dart';
import 'package:flutter_application_1/services/agencias_service.dart';

class AgenciasAdm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Lógica para voltar
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 156, 39, 176)
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
                      Color.fromARGB(255, 156, 39, 176)
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
                                        '/editar_informacoes_banco',
                                        arguments: {
                                          'agencia':
                                              agenciaAtual, // passando a agência atual como argumento
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
