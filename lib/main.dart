import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:diario_treinos/firebase_options.dart';
import 'package:diario_treinos/screens/login_screen.dart';
import 'package:diario_treinos/screens/cadastro_screen.dart';
import 'package:diario_treinos/screens/treino_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/login',

      routes: {
        '/login': (context) => const LoginScreen(),
        '/cadastro': (context) => const CadastroScreen(),
        '/treinos': (context) => const TreinoScreen(),
      },
    );
  }
}
