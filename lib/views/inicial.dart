import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 156, 39, 176)
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.PNG',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login_adm');
                      print('Botão Admin pressionado');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 225, 9, 196),
                      onPrimary: Colors.white,
                      minimumSize: Size(120, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30), // Define o formato arredondado
                      ),
                    ),
                    child: Text('ADMIN'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');

                      print('Botão Cliente pressionado');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 225, 9, 196),
                      onPrimary: Colors.white,
                      minimumSize: Size(120, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30), // Define o formato arredondado
                      ),
                    ),
                    child: Text('CLIENTE'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
