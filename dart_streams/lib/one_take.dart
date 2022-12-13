// ignore_for_file: avoid_print

void main(List<String> args) async {
  print('TAKE');
  /* Para criar uma Stream precisamos de um controller com excessão do periodic*/

  const interval = Duration(microseconds: 1);
  /* Um callback apenas para termos um valor */
  var stream = Stream<int>.periodic(interval, callback);

  /* TAKE -> número exato de requisições: Podemos Transformar ou controlar os dados enviados pela STREAM ex. ele enviara somente
     cinco vezes os dados e depois para impomos um limite nessas requisições

     TAKE controla a quantidade de requisições na entrada
  */
  stream = stream.take(5);

  /*Este tipo de for ele é ativado qdo o periodic enviar os dados é diferente de um loop infinito  */
  await for (var i in stream) {
    print(i);
  }
}

int callback(int value) {
  return (value + 1) * 2;
}
