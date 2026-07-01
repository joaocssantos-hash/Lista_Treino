import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/treino.dart';

class TreinoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _colecao = 'treinos';

  Future<void> adicionarTreino(Treino treino) async {
    await _firestore.collection(_colecao).add(treino.toMap());
  }

  Stream<List<Treino>> listarTreinos() {
    return _firestore.collection(_colecao).snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Treino.fromMap(doc.id, doc.data()))
          .toList();
    });
  }

  Future<void> removerTreino(String id) async {
    await _firestore.collection(_colecao).doc(id).delete();
  }
}
