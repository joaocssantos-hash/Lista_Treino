import 'package:flutter/material.dart';
import 'package:diario_treinos/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {
  final emailController =
      TextEditingController();

  final senhaController =
      TextEditingController();

  final authService = AuthService();

  Future<void> fazerLogin() async {
    try {
      await authService.login(
        emailController.text,
        senhaController.text,
      );
      if (!mounted) return;

      Navigator.pushNamedAndRemoveUntil(
        context,
        '/treinos',
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration:
                  const InputDecoration(
                labelText: 'E-mail',
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: senhaController,
              obscureText: true,
              decoration:
                  const InputDecoration(
                labelText: 'Senha',
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: fazerLogin,
              child: const Text('Entrar'),
            ),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/cadastro',
                );
              },
              child:
                  const Text('Criar conta'),
            ),
          ],
        ),
      ),
    );
  }
}