import 'package:flutter/material.dart';
import 'package:health_4_all/features/orderRequested/orderRequested_view.dart';
import 'package:health_4_all/features/welcomeHome/welcome_home.dart';
import 'package:health_4_all/features/welcomeHome/welcome_home_view.dart';

class AnalysisPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Obrigada pela inscrição',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Um e-mail será enviado com o seu acesso de login.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeHomeView(onQueroMeCadastrarPressed: () {}, onJaSouCadastradoPressed: () {},)),
                    );
              },
              child: Text('Voltar para o início',
                      style: TextStyle(color: Colors.green)),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AnalysisPageView(),
  ));
}