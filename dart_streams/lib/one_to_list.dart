// ignore_for_file: avoid_print

void main(List<String> args) async {
  print('LISTEN');
  /* Para criar uma Stream precisamos de um controller com excessão do periodic*/

  const interval = Duration(microseconds: 1);
  /* Um callback apenas para termos um valor */
  var stream = Stream<int>.periodic(interval, callback);

  /*
    TO LIST regatando todos os daos de uma unica vez em uma lista
    ele fica como um repositorio de dados armazenando os dados e depois de 
    acordo com a regra do take ele libera todas em uma unica vez
  */
  stream = stream.take(5);
  final data = await stream.toList();

  print('FIM DO LIST $data');
}

int callback(int value) {
  print('Valor Callback: $value');
  return (value + 1) * 2;
}
