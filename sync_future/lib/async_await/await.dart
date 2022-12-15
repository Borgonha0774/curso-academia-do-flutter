// ignore_for_file: avoid_print

void main(List<String> args) {
  final totalAlunos = totalDeAlunos(); // passo 1
  totalAlunos
      // passo 6 finalizou o event loop e retornou os dados
      .then((value) => print('O total de alunos é $value'))
      .catchError((e) {
    print(e);
  });
  // passo 4 retornou para o main e informou que o future está incompleto pq aqui não temos o await
  print('Resposta: $totalAlunos');
}

// Passo 2
/* Fazer uma simulação como se fosse buscar no backend os dados */
Future<int> totalDeAlunos() async {
  print('Esse ponto do método é sincrono antes do await');
  /* Com o modificador await recebemos os dados assimq for finalizado */
  // passo 3 em função do await ele mudou de sync para async e registrou no event loop
  final buscandoTotalDeAlunos = await Future.value(887);
  // passo 5 finalizou o future no event loop
  print('Esse ponto do método é depois do await');
  return buscandoTotalDeAlunos;
}
