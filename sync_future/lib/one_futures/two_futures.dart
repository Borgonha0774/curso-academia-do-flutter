// ignore_for_file: avoid_print

void main(List<String> args) {
  print('Levando o carro para a mecãnica');
  Future(
    () {
      //função assincrona ele executa e qdo pronto retorna (fazendo orçamneto do)
      return 10 ~/ 2;
    },
  ).then((valorDoOrcamento) =>
      print('O Orçamento para arrumar o carro é $valorDoOrcamento'));

  print('Saindo da mecãnica');
  print('Fui viajar');

  Future(
    () {
      /* forçando um erro */
      throw Exception('Avião caiu');
      //função assincrona ele executa e qdo pronto retorna (Indo a USA)
      return 'MacBook Comprado';
    },
  ).then((comprado) => print(' $comprado')).catchError((onError) {
    print('Deu ruim o avião caiu');
  }).whenComplete(() => print('Finalizando a viagem acontece com ou sem erro'));

  /* Trabalhando com futures */
  print('\n****************** Trabalhando com futures ******************');
  /* Aqui podemos garantir que não gerará erro */
  Future(
    () => 10 ~/ 2,
  ).then((value) => print('Valor calculado 1 $value'));
  Future(
    () => 10 ~/ 0,
  ).then((value) => print('Valor calculado 2 $value'), onError: (error) {
    print('Método sem catchError (onError) Ocorreu um erro $error');
  }).catchError(() => print('Executa apenas o onError'));

  Future(
    () {
      /* forçando um erro */
      throw Exception('Error 1');
    },
  ).then((value) => print(value)).catchError(
      (e) => print('ocorreu um erro no cacth $e'),
      test: (error) => error is UnsupportedError);
}
