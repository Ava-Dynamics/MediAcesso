import 'package:flutter/material.dart';
import 'package:health_4_all/features/formElegibility/form_elegibility_view.dart';

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
            Text(
              'Bem-vindo(a) ao MediFarma Delivery',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 240),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormElegibilityView()),
                );
              },
              child: Text('Quero me cadastrar'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Já sou cadastrado pressionado');
              },
              child: Text('Já sou cadastrado'),
            ),
          ],
        ),
      ),
    );
  }
}
