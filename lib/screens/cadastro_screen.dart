import 'package:flutter/material.dart';
import 'package:diario_treinos/services/auth_service.dart';


class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final emailController = TextEditingController();

  final senhaController = TextEditingController();

  final authService = AuthService();

  Future<void> cadastrar() async {
    try {
      await authService.cadastro(emailController.text, senhaController.text);
      if (!mounted) return;

      Navigator.pushNamedAndRemoveUntil(context, '/treinos', (route) => false);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: cadastrar,
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
