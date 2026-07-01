class Treino {
  String? id;
  String exercicio;
  int series;
  int repeticoes;

  Treino({
    this.id,
    required this.exercicio,
    required this.series,
    required this.repeticoes,
  });

  factory Treino.fromMap(String id, Map<String, dynamic> map) {
    return Treino(
      id: id,
      exercicio: map['exercicio'],
      series: map['series'],
      repeticoes: map['repeticoes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'exercicio': exercicio, 'series': series, 'repeticoes': repeticoes};
  }
}
