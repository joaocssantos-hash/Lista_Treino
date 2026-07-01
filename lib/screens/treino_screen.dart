import 'package:flutter/material.dart';

import '../models/treino.dart';
import '../services/treino_service.dart';

class TreinoScreen extends StatefulWidget {
  const TreinoScreen({super.key});

  @override
  State<TreinoScreen> createState() => _TreinoScreenState();
}

class _TreinoScreenState extends State<TreinoScreen> {
  final treinoService = TreinoService();

  final exercicioController = TextEditingController();

  final seriesController = TextEditingController();

  final repeticoesController = TextEditingController();

  Future<void> adicionarTreino() async {
    final treino = Treino(
      exercicio: exercicioController.text,

      series: int.parse(seriesController.text),

      repeticoes: int.parse(repeticoesController.text),
    );

    await treinoService.adicionarTreino(treino);

    exercicioController.clear();
    seriesController.clear();
    repeticoesController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Diário de Treinos')),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),

            child: Column(
              children: [
                TextField(
                  controller: exercicioController,

                  decoration: const InputDecoration(labelText: 'Exercício'),
                ),

                TextField(
                  controller: seriesController,

                  decoration: const InputDecoration(labelText: 'Séries'),
                ),

                TextField(
                  controller: repeticoesController,

                  decoration: const InputDecoration(labelText: 'Repetições'),
                ),

                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: adicionarTreino,

                  child: const Text('Adicionar'),
                ),
              ],
            ),
          ),

          Expanded(
            child: StreamBuilder<List<Treino>>(
              stream: treinoService.listarTreinos(),

              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final treinos = snapshot.data!;

                return ListView.builder(
                  itemCount: treinos.length,

                  itemBuilder: (context, index) {
                    final treino = treinos[index];

                    return ListTile(
                      title: Text(treino.exercicio),

                      subtitle: Text(
                        '${treino.series} séries - ${treino.repeticoes} reps',
                      ),

                      trailing: IconButton(
                        icon: const Icon(Icons.delete),

                        onPressed: () {
                          treinoService.removerTreino(treino.id!);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
