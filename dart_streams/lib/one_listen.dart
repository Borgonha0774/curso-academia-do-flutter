// ignore_for_file: avoid_print

void main(List<String> args) async {
  print('SKIP WHILE');
  /* Para criar uma Stream precisamos de um controller com excessão do periodic*/

  const interval = Duration(microseconds: 1);
  /* Um callback apenas para termos um valor */
  var stream = Stream<int>.periodic(interval, callback);

  /*
    Listen  eu posso ficar escutando os daos chegando e traçar uma regra 
    de acordo com o valor recebido
  */
  stream = stream.take(10);
  stream.listen((numero) {
    print('Listen numero: $numero');
  });
}

int callback(int value) {
  print('Valor Callback: $value');
  return (value + 1) * 2;
}
