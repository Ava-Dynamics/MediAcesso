import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health_4_all/features/welcomeHome/welcome_home.dart';

// void main() {
//   runApp(MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  await Firebase.initializeApp();
}