import 'package:flutter/material.dart';

class WelcomeHomeViewModel with ChangeNotifier {
  
  void onQueroMeCadastrarPressed() {
    // Lógica específica para o botão "Quero me cadastrar"
  }

  void onJaSouCadastradoPressed() {
    // Lógica específica para o botão "Já sou cadastrado"
  }
  
  void navigateToAttachPage(BuildContext context) {
    Navigator.pushNamed(context, '/attachPage');
  }
}