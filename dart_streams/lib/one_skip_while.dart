// ignore_for_file: avoid_print

void main(List<String> args) async {
  print('SKIP WHILE');
  /* Para criar uma Stream precisamos de um controller com excessão do periodic*/

  const interval = Duration(microseconds: 1);
  /* Um callback apenas para termos um valor */
  var stream = Stream<int>.periodic(interval, callback);

  /* SKIP WHILE-> Ele pula as  informações que chegam de acordo
    com a limitação imposta pelo skip while 

    Neste exemplo podemos ver que enquanto o valor advindo da stream for menor q 2
    ele não permitiu passar o dado e depois ele liberou de acordo com a quntidade imposta pleo take
  */
  stream = stream.take(5).skipWhile((int value) => value <= 2);

  /*Este tipo de for ele é ativado qdo o periodic enviar os dados é diferente de um loop infinito  */
  await for (var i in stream) {
    print(i);
  }
}

int callback(int value) {
  print('Valor Callback: $value');
  return (value + 1) * 2;
}
