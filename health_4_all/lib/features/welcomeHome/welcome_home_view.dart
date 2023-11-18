import 'package:flutter/material.dart';

class WelcomeHomeView extends StatelessWidget {
  final Function() onQueroMeCadastrarPressed;
  final Function() onJaSouCadastradoPressed;

  WelcomeHomeView({
    required this.onQueroMeCadastrarPressed,
    required this.onJaSouCadastradoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem vindo(a) ao MediFarma Delivery',
              textAlign:TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 240),
            ElevatedButton(
              onPressed: () {
                print('Quero me cadastrar pressionado');
              },
              child: const Text('Quero me cadastrar')
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica do botão "Já sou cadastrado"
                print('Já sou cadastrado pressionado');
            },
              child: const Text('Já sou cadastrado'),
        ),
        ],
        ),
      ),
    );
  }
}
