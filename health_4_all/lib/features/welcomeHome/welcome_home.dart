import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_4_all/features/welcomeHome/welcome_home_view.dart';
import 'package:health_4_all/features/welcomeHome/welcome_home_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => WelcomeHomeViewModel(),
        child: WelcomeHomePage(),
      ),
    );
  }
}

class WelcomeHomePage extends StatelessWidget {
  const WelcomeHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => WelcomeHomeViewModel(),
        child: WelcomeHomePageContent(),
      ),
    );
  }
}

class WelcomeHomePageContent extends StatelessWidget {
  const WelcomeHomePageContent({Key? key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WelcomeHomeViewModel>(context);

    return ChangeNotifierProvider(
      create: (context) => WelcomeHomeViewModel(),
      child: WelcomeHomeView(
        onQueroMeCadastrarPressed: () {
          Navigator.pushNamed(context, '/formElegibility');
        },
        onJaSouCadastradoPressed: () {
          Navigator.pushNamed(context, '/attachPage');
        },
      ),
    );
  }
}
