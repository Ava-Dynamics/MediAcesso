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
              'Bem-vindo(a) ao MediFarma Delivery!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 100),
            Text(
              'Oferecemos medicamentos gratuitamente para o tratamento de condições como diabetes, asma, e outras, destinados às pessoas com mobilidade reduzida.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormElegibilityView()),
                );
              },
              child: Text(
                'Quero me cadastrar',
                style: TextStyle(color: Colors.green), // Alteração da cor do texto para verde
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Já sou cadastrado pressionado');
              },
              child: Text(
                'Já sou cadastrado',
                style: TextStyle(color: Colors.green), // Alteração da cor do texto para verde
              ),
            ),
          ],
        ),
      ),
    );
  }
}
