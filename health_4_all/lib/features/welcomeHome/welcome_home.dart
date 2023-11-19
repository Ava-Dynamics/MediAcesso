import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_4_all/features/welcomeHome/welcome_home_view.dart';
import 'package:health_4_all/features/welcomeHome/welcome_home_view_model.dart';

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
  const WelcomeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WelcomeHomeViewModel>(context);

    return WelcomeHomeView(
      onQueroMeCadastrarPressed: viewModel.onQueroMeCadastrarPressed,
      onJaSouCadastradoPressed: viewModel.onJaSouCadastradoPressed,
    );
  }
}
