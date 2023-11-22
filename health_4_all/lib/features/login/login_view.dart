import 'package:flutter/material.dart';
import 'package:health_4_all/features/mainHome/main_home_view.dart';

class LoginPage extends StatelessWidget {
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Centraliza o título na AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bem-vindo(a) ao MediFarma Delivery',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              focusNode: emailFocusNode,
              decoration: InputDecoration(
                labelText: 'E-mail',
                fillColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              focusNode: passwordFocusNode,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainHomeView()),
                );
              },
              child: Text('Login', style: TextStyle(color: Colors.green)),
            ),
          ],
        ),
      ),
    );
  }
}
